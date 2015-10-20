# run analysis

feat <- read.table('features.txt')
act <- read.table('activity_labels.txt')

getActivity <- function(key){
        as.character(act[key,2])
}

if(!exists("X")){
        X <- read.table('test/X_test.txt', header=F, sep="", strip.white=T)
        X <- rbind(X,read.table('train/X_train.txt', header=F, sep="", strip.white=T))
}
if(!exists("Y")){
        Y <- read.table('test/Y_test.txt', header=F, sep="", strip.white=T)
        Y <- rbind(Y,read.table('train/Y_train.txt', header=F, sep="", strip.white=T))
}
if(!exists("subj")){
        subj <- read.table('test/subject_test.txt', header=F, sep="", strip.white=T)
        subj <- rbind(subj,read.table('train/subject_train.txt', header=F, sep="", strip.white=T))
}
# 
# if(!exists("b.a.x")){
#         b.a.x <- read.table('test/Inertial Signals/body_acc_x_test.txt', head=F, sep="", strip.white=T)
#         b.a.x <- rbind(b.a.x,read.table('train/Inertial Signals/body_acc_x_train.txt', head=F, sep="", strip.white=T))
# }
# if(!exists("b.a.y")){
#         b.a.y <- read.table('test/Inertial Signals/body_acc_y_test.txt', head=F, sep="", strip.white=T)
#         b.a.y <- rbind(b.a.y,read.table('train/Inertial Signals/body_acc_y_train.txt', head=F, sep="", strip.white=T))
# }
# if(!exists("b.a.z")){
#         b.a.z <- read.table('test/Inertial Signals/body_acc_z_test.txt', head=F, sep="", strip.white=T)
#         b.a.z <- rbind(b.a.z,read.table('train/Inertial Signals/body_acc_z_train.txt', head=F, sep="", strip.white=T))
# }
# # now just use t.a.z.test as a proxy for the rest! sloppy, but good enough for me
# if(!exists('b.g.x')){
#         b.g.x <- read.table('test/Inertial Signals/body_gyro_x_test.txt', head=F, sep="", strip.white=T)
#         b.g.x <- rbind(b.g.x,read.table('train/Inertial Signals/body_gyro_x_train.txt', head=F, sep="", strip.white=T))
# }
# if(!exists('b.g.y')){
#         b.g.y <- read.table('test/Inertial Signals/body_gyro_y_test.txt', head=F, sep="", strip.white=T)
#         b.g.y <- rbind(b.g.y,read.table('train/Inertial Signals/body_gyro_y_train.txt', head=F, sep="", strip.white=T))
# }
# if(!exists('b.g.z')) {
#         b.g.z <- read.table('test/Inertial Signals/body_gyro_z_test.txt', head=F, sep="", strip.white=T)
#         b.g.z <- rbind(b.g.z,read.table('train/Inertial Signals/body_gyro_z_train.txt', head=F, sep="", strip.white=T))
# }
# if(!exists('t.a.x')) {
#         t.a.x <- read.table('test/Inertial Signals/total_acc_x_test.txt', head=F, sep="", strip.white=T)
#         t.a.x <- rbind(t.a.x,read.table('train/Inertial Signals/total_acc_x_train.txt', head=F, sep="", strip.white=T))
# }
# if(!exists('t.a.y')) {
#         t.a.y <- read.table('test/Inertial Signals/total_acc_y_test.txt', head=F, sep="", strip.white=T)
#         t.a.y <- rbind(t.a.y,read.table('train/Inertial Signals/total_acc_y_train.txt', head=F, sep="", strip.white=T))
# }
# if(!exists('t.a.z')) {
#         t.a.z <- read.table('test/Inertial Signals/total_acc_z_test.txt', head=F, sep="", strip.white=T)
#         t.a.z <- rbind(t.a.z,read.table('train/Inertial Signals/total_acc_z_train.txt', head=F, sep="", strip.white=T))
# }

# columns of X to get
isMean <- function(word){
        to.ret <- grepl("mean[(][)]",word) # checks for all caps followed by colon
        to.ret
}
isStd <- function(word){
        to.ret <- grepl("std[(][)]",word) # checks for all caps followed by colon
        to.ret
}

make.readable <- function(argvec) {
        to.ret.vec <- character(length(argvec))
        for (i in 1:length(argvec)) {
                varname <- argvec[i]
                to.ret <- character()
                suff <- 'direction'
                
                if(isMean(varname)){
                        to.ret <- 'Mean'
                } else {
                        to.ret <- 'Std.Dev'
                }
                if(grepl("^t",varname)){
                        to.ret <- paste(to.ret, 'Time.domain',sep='.',collapse='.')
                } else {
                        to.ret <- paste(to.ret, 'Freq.domain',sep='.',collapse='.')
                }
                if (grepl("Body",varname)) {
                        to.ret <- paste(to.ret, "Body", sep='.',collapse='.')
                }
                if (grepl("Gravity",varname)) {
                        to.ret <- paste(to.ret, "Gravitational", sep='.',collapse='.')
                }
                if (grepl("Gyro",varname)) {
                        to.ret <- paste(to.ret, "Angular", sep='.',collapse='.')
                        suff <- 'axis'
                        if (grepl("Jerk",varname)) {
                                to.ret <- paste(to.ret, "Accel", sep='.',collapse='.')
                        } else {
                                to.ret <- paste(to.ret, "Velocity", sep='.',collapse='.')
                        }
                } else {
                        if (grepl("Jerk",varname)) {
                                to.ret <- paste(to.ret, "Jerk", sep='.',collapse='.')
                        } else {
                                to.ret <- paste(to.ret, "Accel", sep='.',collapse='.')
                        }
                }
                if (grepl("X",varname)) {
                        to.ret <- paste(to.ret, "X",suff,sep='.', collapse='')
                }
                if (grepl("Y",varname)) {
                        to.ret <- paste(to.ret, "Y",suff, sep='.', collapse='')
                }
                if (grepl("Z",varname)) {
                        to.ret <- paste(to.ret, "Z",suff, sep='.', collapse='')
                }
                if (grepl("Mag",varname)) {
                        to.ret <- paste(to.ret, "Magnitude",sep='.', collapse='.')
                }
                to.ret.vec[i] <- to.ret
        }
        to.ret.vec
}

cols <- numeric()
for (i in 1:561){
        if(isMean(feat[i,2]) | isStd(feat[i,2])){
                cols <- append(cols,i)
        }
}

# uncomment this if you need to
X1 <- X[,cols] # just picking out the variables we want
colnames(X1) <- make.readable(feat[cols,2])
X2 <- mutate(X1,'Activity.Name' = getActivity(Y$V1))
X3 <- mutate(X2,'Subject.ID'=subj$V1)
group.test <- group_by(X3,Subject.ID,Activity.Name)
tidy.data <- summarise_each(group.test,funs(mean))
write.table(tidy.data, 'tidy_data.txt', row.name=F) # and there it is. I think.