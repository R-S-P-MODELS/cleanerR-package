% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Encontrar_candidatos_dataset_v1.R
\name{autoComplete}
\alias{autoComplete}
\title{\code{autoComplete} Asks for a dataframe, a vector of collumn indices and the goal collumn and  returns the data frame with the values filled}
\usage{
autoComplete(df, goal, maxi, repetitions, trigger = 1, ratio = 0.99)
}
\arguments{
\item{df}{A dataframe with the missing values you wish to fill}

\item{goal}{The collum with the missing values you wish to fill}

\item{maxi}{What will be the length of possible combinations you will test example if 2 they will test up to all possible pairs of collums}

\item{repetitions}{Measure of error, the bigger the less likely you will get the right prediction}

\item{trigger}{When you pair all possible combination of tuples a percentage of them will show only once, trigger rejects the set if this percentage is higher than this value}

\item{ratio}{Rejects collumns that the ratio of unique values to total values is higher than this value, primary keys have ratio equal to 1}
}
\description{
\code{autoComplete} Asks for a dataframe, a vector of collumn indices and the goal collumn and  returns the data frame with the values filled
}
\examples{
#The auto Complete Function shall do the following
#Take a dataframe and a goal collumn to predict
#Tests every combination of vectors limited by a parameter length
#Use the best set to predict with accuracy given by MeanAccuracy function
#Then to run some experiments first lets build a dataframe
e=sample(1:5,1e4,replace=TRUE)
e1=sample(1:5,1e4,replace=TRUE)
e2=sample(1:5,1e4,replace=TRUE)
e=data.frame(e,e1,e2,paste(LETTERS[e],LETTERS[e1]),paste(LETTERS[e],LETTERS[e1],LETTERS[e2])   )
#Now we got a dataframe lets create a copy of it
ce=e
ce[sample(1:nrow(e),0.3*nrow(e)),5]=NA
#So 30 percent of the data is now missing
#Lets try to recover it then with autocomplete
ce1=autoComplete(df=ce,goal=5,maxi=3,repetitions=nrow(ce),trigger=1)
#We can see how many values are still missing with NA_VALUES
print(NA_VALUES(ce1) )
#And check how many we got wrong by
print(sum(ce1[,5]!=e[,5]) )
# The process could be done for the 4 collum as well
ce=e
ce[sample(1:nrow(e),0.5*nrow(e)),4]=NA
#So 50 percent of the data is now missing
#Lets try to recover it then with autocomplete
ce1=autoComplete(df=ce,goal=4,maxi=4,repetitions=nrow(ce),trigger=1)
#We can see how many values are still missing with NA_VALUES
print(NA_VALUES(ce1) )
#And check how many we got wrong by
print(sum(ce1[,4]!=e[,4]) )
#Here we can easily see e holds the original data
#ce1 is the recovered data
}
