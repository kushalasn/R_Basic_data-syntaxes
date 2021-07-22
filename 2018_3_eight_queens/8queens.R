setwd("C:/Users/kushal/Desktop/LeetCode-Files/R/Ex_Files_Code_Clinic_R/Ex_Files_Code_Clinic_R/Exercise Files/2018_3_eight_queens")
source("plotTheQueens.R")
library(combinat)

# test values -------------------------------------------------------------
fail_posDiagonal <- c(1,2,3,4,5,6,7,8) # fails because of positive diagonals
fail_negDiagonal <- c(8,7,6,5,4,3,2,1) # fails because of negative diagonals
fail_dupRows <- c(1,1,2,3,4,5,6,7) # fails because of duplicate rows
validSolution <- c(7,5,3,1,6,8,2,4) # This should work
#--------------------------------------------------------------
# Finding the diagonal conflicts
#create DiagValues returns a vector identifying diagonal attack rows
createDaigValues <- function(select_row,select_col,up_or_down=1)
{
  padwithzeroes <- c(rep.int(0,times=select_col))
  
  diag_conflicts <- seq.int(from=select_row+up_or_down,by=up_or_down,length.out =8-up_or_down)
  diag_conflicts <- replace(diag_conflicts,diag_conflicts<0,0)
  diag_conflicts <- replace(diag_conflicts,diag_conflicts>8,0)
  return(c(padwithzeroes,diag_conflicts))
  
}

valid_queens <- function(potentialsolution)
{
  for (eachelement in 1:8)
  {
    diagonal_conflicts <- createDaigValues(potentialsolution[eachelement],eachelement,1)
    checker <- potentialsolution-diagonal_conflicts
    if(any(checker==0))
    {return (FALSE)}
    
    diagonal_conflicts <- createDaigValues(potentialsolution[eachelement],eachelement,-1)
    checker <- potentialsolution-diagonal_conflicts
    if(any(checker==0))
    {return (FALSE)}
  }
  return(TRUE)
}

valid_queens(fail_dupRows)

#permutation for all possible solutions
allpossiblesols <- permn(1:8)
validsols <- rep(NA,length(allpossiblesols))

runqueen <- function()
{
 
  allposlength <- length(allpossiblesols)
  for (queenrow in 1:allposlength)
  {
   validsols[queenrow]<<-valid_queens(allpossiblesols[[queenrow]]) #validsols is outside the environment of runqueen function, hence <<- is an assignment operator that is used
  }
}
runqueen()
allvalidsols <- allpossiblesols[validsols]


#plotting the 8 queen problem solution
for (queenplot in 1:length(allvalidsols))
{
  plotARowOfQueens(allvalidsols[[queenplot]])
  Sys.sleep(1)
}


