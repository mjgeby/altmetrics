counts_raw <- read.delim("data/counts-raw.txt.gz")
dim(counts_raw)
head(counts_raw)
tail(counts_raw)
counts_raw[1, 10]
counts_raw[1:3, 10:12]
counts_raw[1:3, ]
counts_raw[1:10, "pmid"]
str(counts_raw$daysSincePublished)
head(counts_raw$daysSincePublished / 7)
head(counts_raw$daysSincePublished / c(7, 1))
  # divides vector (counts_raw#daySincePublished) by 7 (first value) then by 1 (second value)
is.numeric(counts_raw$daysSincePublished)
str(counts_raw$journal)
levels(counts_raw$journal)
counts_raw$authorsCount[1:10]
is.na(counts_raw$authorsCount[1:10])
anyNA(counts_raw$authorsCount[1:10])
summary(counts_raw$wosCountThru2011)
mean(counts_raw$wosCountThru2011)
hist(sqrt(counts_raw$wosCountThru2011))
plot(counts_raw$daysSincePublished, counts_raw$wosCountThru2011)
plot(counts_raw$daysSincePublished / 7, counts_raw$wosCountThru2011)
counts_raw$authorsCount[1:10] > 7
counts_raw$authorsCount[1:10]
dim(counts_raw[counts_raw$journal != "pone", ])
dim(counts_raw[counts_raw$journal %in% c("pone", "pbio", "pgen"), ])
dim(counts_raw[grepl("Immunology", counts_raw$plosSubjectTags), ])
head(counts_raw$plosSubjectTags)
if(anyNA(counts_raw$authorsCount)) {
  print("Be careful, data is incomplete")
} else{
  print("Data looks good")
}

if(anyNA(c(1,1,1,1,2))) {
  print("Be careful, data is incomplete")
} else{
  print("Data looks good")
}  

for (i in c("cat", "dog", "mouse")){
  print("Tacos")
}

x <- numeric()
for (i in 1:length(counts_raw$wosCountThru2011)){
  x <- c(x, counts_raw$wosCountThru2011[i] + 1)
}
# Above is a slow loop

levels(counts_raw$journal)
results <- numeric(length = length(levels(counts_raw$journal)))
results
names(results) <- levels(counts_raw$journal)
results
results["pone"]
# this allows you to quickly assess the numbers in each category/column

for (j in levels(counts_raw$journal)){
  results[j] <- mean(counts_raw$wosCountThru2011[counts_raw$journal == j])
  # wanting to figure out the average counts for each publication in 2011 and 
  # then pull out only those in our 'results' variable
}
results
