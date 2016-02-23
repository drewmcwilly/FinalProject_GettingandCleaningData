library(dplyr)
##import common labels for features and activities
        features<-read.table("UCI HAR Dataset/features.txt")
        activity<-read.table("UCI HAR Dataset/activity_labels.txt")
       
  #import and merge activity ids and lables for train and test activities
        train_label<-merge(read.table("UCI HAR Dataset/train/y_train.txt"),activity, by.x="V1", by.y = "V1")
        test_label<-merge(read.table("UCI HAR Dataset/test/y_test.txt") ,activity, by.x="V1", by.y = "V1")   

        
##Pull in training and test set subjects labelling columns on import
 
  #training/test obs
          train_set<-read.table("UCI HAR Dataset/train/X_train.txt", col.names=features$V2)
          test_set<-read.table("UCI HAR Dataset/test/X_test.txt", col.names=features$V2)
  #Ids of subjects performing training/tests
          train_subject<-read.table("UCI HAR Dataset/train/subject_train.txt")
          test_subject<-read.table("UCI HAR Dataset/test/subject_test.txt")
 
##label rows in data sets with subjects and activity
        
         train_set<-cbind(subject=train_subject$V1, Activity=train_label$V2, train_set)
         test_set<-cbind(subject=test_subject$V1, Activity=test_label$V2, test_set)
#combine test and training sets
         comb_sets<-rbind(train_set,test_set)
  #remove unwanted fields       
         comb_sets<-comb_sets[,c(1,2,which(grepl("std",colnames(comb_sets))|grepl("mean",colnames(comb_sets))))]
        
#Tidy up using summarize_each function in dplyr
         tidy_data<-comb_sets%>% group_by(subject,Activity)%>% summarise_each(funs(mean))
#Clean Up column names
         colnames(tidy_data)<-gsub("^t","Time",colnames(tidy_data))
         colnames(tidy_data)<-gsub("^f","Frequency",colnames(tidy_data))
         colnames(tidy_data)<-gsub(".mean","Mean",colnames(tidy_data))
         colnames(tidy_data)<-gsub(".std","STD",colnames(tidy_data))
         colnames(tidy_data)<-gsub("\\...","",colnames(tidy_data))
         colnames(tidy_data)<-gsub("\\..","",colnames(tidy_data))
#export data to csv file "TidyData.csv"         
         write.csv(tidy_data, file = "TidyData.csv",row.names=FALSE)

         