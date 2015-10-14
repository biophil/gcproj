# run analysis

X_test <- read.table('test/X_test.txt', header=F, sep="", strip.white=T)
Y_test <- read.table('test/Y_test.txt', header=F, sep="", strip.white=T)
subj_test <- read.table('test/subject_test.txt', header=F, sep="", strip.white=T)
X_train <- read.table('train/X_train.txt', header=F, sep="", strip.white=T)
Y_train <- read.table('train/Y_train.txt', header=F, sep="", strip.white=T)
subj_train <- read.table('train/subject_train.txt', header=F, sep="", strip.white=T)