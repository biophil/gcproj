# run analysis

if(!exists("X_test")){
        X_test <- read.table('test/X_test.txt', header=F, sep="", strip.white=T)
}
if(!exists("Y_test")){
        Y_test <- read.table('test/Y_test.txt', header=F, sep="", strip.white=T)
}
if(!exists("subj_test")){
        subj_test <- read.table('test/subject_test.txt', header=F, sep="", strip.white=T)
}
if(!exists("X_train")){
        X_train <- read.table('train/X_train.txt', header=F, sep="", strip.white=T)
}
if(!exists("Y_train")){
        Y_train <- read.table('train/Y_train.txt', header=F, sep="", strip.white=T)
}
if(!exists("subj_train")){
        subj_train <- read.table('train/subject_train.txt', header=F, sep="", strip.white=T)
}

if(!exists("b.a.x.test")){
        b.a.x.test <- read.table('test/Inertial Signals/body_acc_x_test.txt', head=F, sep="", strip.white=T)
}
if(!exists("b.a.y.test")){
        b.a.y.test <- read.table('test/Inertial Signals/body_acc_y_test.txt', head=F, sep="", strip.white=T)
}
if(!exists("b.a.z.test")){
        b.a.z.test <- read.table('test/Inertial Signals/body_acc_z_test.txt', head=F, sep="", strip.white=T)
}
# now just use t.a.z.test as a proxy for the rest! sloppy, but good enough for me
if(!exists('t.a.y.test')){
        b.g.x.test <- read.table('test/Inertial Signals/body_gyro_x_test.txt', head=F, sep="", strip.white=T)
        b.g.y.test <- read.table('test/Inertial Signals/body_gyro_y_test.txt', head=F, sep="", strip.white=T)
        b.g.z.test <- read.table('test/Inertial Signals/body_gyro_z_test.txt', head=F, sep="", strip.white=T)
        t.a.x.test <- read.table('test/Inertial Signals/total_acc_x_test.txt', head=F, sep="", strip.white=T)
        t.a.y.test <- read.table('test/Inertial Signals/total_acc_y_test.txt', head=F, sep="", strip.white=T)
        t.a.z.test <- read.table('test/Inertial Signals/total_acc_z_test.txt', head=F, sep="", strip.white=T)
}



if(!exists("b.a.x.train")){
        b.a.x.train <- read.table('train/Inertial Signals/body_acc_x_train.txt', head=F, sep="", strip.white=T)
}
if(!exists("b.a.y.train")){
        b.a.y.train <- read.table('train/Inertial Signals/body_acc_y_train.txt', head=F, sep="", strip.white=T)
}
if(!exists("b.a.z.train")){
        b.a.z.train <- read.table('train/Inertial Signals/body_acc_z_train.txt', head=F, sep="", strip.white=T)
}
# now just use t.a.z.train as a proxy for the rest! sloppy, but good enough for me
if(!exists('t.a.y.train')){
        b.g.x.train <- read.table('train/Inertial Signals/body_gyro_x_train.txt', head=F, sep="", strip.white=T)
        b.g.y.train <- read.table('train/Inertial Signals/body_gyro_y_train.txt', head=F, sep="", strip.white=T)
        b.g.z.train <- read.table('train/Inertial Signals/body_gyro_z_train.txt', head=F, sep="", strip.white=T)
        t.a.x.train <- read.table('train/Inertial Signals/total_acc_x_train.txt', head=F, sep="", strip.white=T)
        t.a.y.train <- read.table('train/Inertial Signals/total_acc_y_train.txt', head=F, sep="", strip.white=T)
        t.a.z.train <- read.table('train/Inertial Signals/total_acc_z_train.txt', head=F, sep="", strip.white=T)
}