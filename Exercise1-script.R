# R script for Project 1, Exploratory Data Analysis

# Sets the Working Directory and loads in dataframe as "df"
setwd("~/Desktop/MOOCs/Coursera/Data Science/Exploratory Data Analysis/Assignment-1")
dataset <- read.csv('household_power_consumption.txt', header=TRUE, sep=';', 
         na.strings='?', dec='.')


