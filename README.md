---
Title: "Getting and Cleaning Data - Project Week 3"
Author: "elloumil"
Date: "April 2015"
output: html_document
---
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The following explains how all of the script works:

1. Unzip the files from source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder named "data_sets_project" in your working directory (getwd())

2. Put project.R into your working directory

3. Run the script by using: 
  ``` 
source("project.R")
```

4. Use the following command to get the resulting data:
  ```
data <- read.table("data_set_with_the_averages.txt") 
```
  You will get a data frame with 180 observations of 68 variables (for 30 subjects and 6 activities).

<br/><br/>
*Remark:*
Make sure that the extracted files are directly under "data\_sets\_project" folder.

You can embed an R code chunk like this:

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```
