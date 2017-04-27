setwd('~/')
setwd('Dropbox/my_code/kaggle_listings')
x <- list.files('columns')
train.names <- rep(NA, 14)
test.names <- rep(NA, 14)
train.ind <- 1
test.ind <- 1
for (i in 1:length(x)){
  #print(x[i])
  if (grepl("interest", x[i])) {
    next()
  }
  if (grepl("train", x[i])) {
    train.names[train.ind] <- x[i]
    train.ind <- train.ind + 1
  } else if (grepl("test", x[i])) {
    test.names[test.ind] <- x[i]
    test.ind <- test.ind + 1
  } else {
    print("grepl error!")
  }
}
print(train.names)
print(test.names)

dir.intro <- paste(getwd(), "/columns/", sep="")
train.df <- read.csv(paste(dir.intro, train.names[1], sep=""))
for (i in 2:length(train.names)) {
  df.next <- read.csv(paste(dir.intro, train.names[i], sep=""))
  train.df <- merge(train.df, df.next, by="id")
}

for (i in 2:length(test.names)) {
  df.next <- read.csv(paste(dir.intro, test.names[i], sep=""))
  test.df <- merge(test.df, df.next, by="id")
}