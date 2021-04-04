
#function will examine model inputs and determine whether to buy or sell shares on a given day 

train.model <- function(data){
  model <- runif(n = 1, min = 0, max = 1)
  return(model)
}
model.predict <- function(model, predictors){
 model <- runif(n = 1, min = 0, max = 1)
 return(model)
}

decision <- function(model, predictors){
  if (model.predict(model,predictors) > .5){
    return(TRUE)
  }
  else {
    return(FALSE)
  }
}



simulate <- function(data, model, capital){
  
  df <- read_csv(data)
  for(i in 1:nrow(df)){
    predictors <- df[i,]
    if (model.predict(model, predictors))
  } 
  
}


main <- function(){
  
  
}