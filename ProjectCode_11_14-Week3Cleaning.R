setwd("~/2015-October/ProjectData/UCI HAR Dataset/test")
aadataXtest<-read.table("X_test.txt")
aaydataYtest<-read.table("y_test.txt")
aaysubjectest<-read.table("subject_test.txt")
####################################################
forconver<-read.table("y_test.txt")
aamydatafea<-read.table("features.txt")
activitylist<-read.table("activity_labels.txt")
atransposefea<-t(aamydatafea)
####################################################
dim(amydatafea)
class(amydatafea)
dim(atransposefea)
class(atransposefea)
#################atransposefea is a matrix###########

setwd("~/2015-October/ProjectData/UCI HAR Dataset/train")
aadataXtrain<-read.table("X_train.txt")
aadataYtrain<-read.table("y_train.txt")
aaysubjectrain<-read.table("subject_train.txt")

#### RowBind Is Done of the Subject Files--AppendingRows #####################
aasubjectfilesrowbind<-rbind(aaysubjectrain,aaysubjectest)
colnames(aasubjectfilesrowbind)[1]<-"Subject"

###########RowBind-AppendingActivies######################################
######The ActivityCodes
aaaactivity<-rbind(aadataYtrain,aaydataYtest)
colnames(aaaactivity)[1]<-"Activities"


# Starting to create the final file
axrowbind<-rbind(aadataXtrain,aadataXtest)
keepaxrowbind<-rbind(aadataXtrain,aadataXtest) ### Backup copy of rowbind
aremovedrow<-atransposefea[-1,]
########################################################
##################Column Bind###########################
######### Now I will do a col bind
adatasetwithact<-cbind(aaaactivity,aasubjectfilesrowbind)
###subject-then-activit-then-measures
thefinaldataset<-cbind(adatasetwithact,axrowbind)

columnsofconcern<-grep("mean|std",aremovedrow)
tcolumnsofconcern<-grep("mean|std",aremovedrow,value=TRUE)
class(columnsofconcern)
dim(columnsofconcern)
impcol=as.vector(columnsofconcern)
class(impcol)
impcol[79]

class(aremovedrow) ##### Character string
atodataframe<-as.data.frame(aremovedrow) ##### convert to dataframe
awenowhavematric<-t(atodataframe) ####### the dataframe is now a matrix
# that contains all of the column names
################Colmunames will no be changed for the first time using the matrix just 
#######created
colnames(axrowbind)<-awenowhavematric
#########################################################################

######### Now I will do a col bind
adatasetwithact<-cbind(aaaactivity,aasubjectfilesrowbind)
###subject-then-activit-then-measures
thefinaldataset<-cbind(adatasetwithact,axrowbind)
tidyset<-write.table(thefinaldataset,row.name=FALSE)

#Cleaning Colnames
grep("*mean",afinaldataset)
library(dplyr)
testselect<-select(afinaldataset,"*mean")
head(select(afinaldataset,Subject))
grep("mean|std",afinaldataset,value=TRUE)
afinaldataset[1,2]
colnames(afinaldataset)[87]
head(afinaldataset[,552])

