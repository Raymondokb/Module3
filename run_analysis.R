activity_label <- read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt")
features <- read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\features.txt")

test_subject_test <- read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt")
test_x_test <- read.table( "D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt")
test_y_test <- read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\y_test.txt")


train_subject_train <- read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt")
train_x_train <- read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\X_train.txt")
train_y_train <- read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\y_train.txt")

grep("mean",features$V2)
grep("std", features$V2)


#union(grep("mean",features$V2),grep("std", features$V2) )
table(test_y_test)