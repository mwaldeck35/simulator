
#function will examine model inputs and determine whether to buy or sell shares on a given day 

train.model <- function(data){

  model <- runif(n = 1, min = .75, max = 1)
  return(model)
}
model.predict <- function(model, predictors){
 model <- runif(n = 1, min = 0, max = 1)
 return(model)
}

decision <- function(model, predictors){
  if (as.double(model.predict(model,predictors)) > .5){
    return(TRUE)
  }
  else {
    return(FALSE)
  }
}

#current implementation allows debt
begin.day <- function(predictors, model, capital){
  shares <- 0
   if (decision(model, predictors)){
   shares <- 1
   capital <- as.double(capital - (predictors["Low"]))
   } 
  output <- c(capital, shares)
}

end.day <- function(shares, capital, closing.price){
  if (shares > 0) {
    return <- closing.price * shares
    capital <- capital + return
  }
  return(capital)
}

simulate <- function(data, model, capital){
  
  current.shares <- 0
  
  
  for(i in 1:nrow(data)){
    predictors <- data[i,]
    #begin day
    update <- begin.day(predictors, model, capital)
    capital <- as.double(update[1])
    shares <- as.integer(update[2])
    #end day
    capital <- as.double(end.day(shares, capital, predictors["High"]))
  }
  return(capital)
 }


main <- function(){
  data <- read_csv("AMZNtrain.csv")
  model <- train.model(data)
  simulate(data, model, 10000)
  
  
}
