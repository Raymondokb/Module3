ssx = read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\X_train.txt")
ssy = read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\y_train.txt")
sssubject = read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt")

labels = read.table( "D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt",stringsAsFactors=FALSE)


#test
ssxtest = read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt")
ssytest = read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\y_test.txt")
sssubjecttest = read.table("D:\\Users\\user\\Downloads\\getdata_2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt")


ssfull = rbind(ssx, ssxtest)
ssfull$activity = rbind(ssy, ssytest)
yfull = rbind(ssy, ssytest)

