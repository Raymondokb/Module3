activity_label <- read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt",stringsAsFactors = FALSE)
features <- read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\features.txt", stringsAsFactors = FALSE)

test_subject_test <- read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt", stringsAsFactors = FALSE)
test_x_test <- read.table( "D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt", stringsAsFactors = FALSE)
test_y_test <- read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\y_test.txt", stringsAsFactors = FALSE)


train_subject_train <- read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt", stringsAsFactors = FALSE)
train_x_train <- read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\X_train.txt", stringsAsFactors = FALSE)
train_y_train <- read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\y_train.txt", stringsAsFactors =FALSE)

grep("mean",features$V2)
grep("std", features$V2)


#union(grep("mean",features$V2),grep("std", features$V2) )
#library(dplyr)
#test_x_test <- tbl_df(test_x_test)
#test_y_test <- tbl_df(test_y_test)
#train_x_train <- tbl_df(train_x_train)
#train_y_train <- tbl_df(train_y_train)

#activity_label <- tbl_df(activity_label)
#features <- tbl_df(features)
#test_subject_test <- tbl_df(test_subject_test)
#train_subject_train <- tbl_df(train_subject_train)

for(i in 1:dim(test_y_test)[1]){
  test_y_test$descript[i] = activity_label[test_y_test[[1]][i],2]
}
for(i in 1:dim(train_y_train)[1]){
  train_y_train$descript[i] = activity_label[train_y_train[[1]][i],2]
}

#Now, time to play

all.data <- rbind(train_x_train, test_x_test)
grep("mean",features$V2)
grep("std", features$V2)
union_index <- union(grep("mean",features$V2),grep("std", features$V2) )

t_all.data <- t(all.data)
subsetted <- t_all.data[union_index,]
all.data2 <- as.data.frame(t(subsetted))

indicators.full <- rbind(train_y_train, test_y_test)
all.data2 <- cbind(all.data2, indicators.full$descript)

colnames(all.data2) <- c(features[union_index,2],"Description")

#"WALKING" etc
all.data2Walk <- all.data2[which(all.data2$Description=="WALKING"),]
all.data2walkup <- all.data2[which(all.data2$Description=="WALKING_UPSTAIRS"),]
all.data2walkdown <- all.data2[which(all.data2$Description=="WALKING_DOWNSTAIRS"),]
all.data2sit <- all.data2[which(all.data2$Description=="SITTING"),]
all.data2stand <- all.data2[which(all.data2$Description=="STANDING"),]
all.data2lay <- all.data2[which(all.data2$Description=="LAYING"),]
