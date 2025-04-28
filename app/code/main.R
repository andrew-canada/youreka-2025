install.packages("Dict")
library(Dict)
install.packages("weights")
library(weights)
allPollutionData <- dict(hi = 0)

pollutant <- 1
k <- lymeCalculate()

while (pollutant != 0) {
  
  mode = readline(prompt = "Linear or multi or compare: ")
  if (mode == "linear") {
    pollutant = readline(prompt = "Which pollutant: ")
    pollutantNum = 0
    if (pollutant == "ozone") {
      pollutantNum = 44201
    } else if (pollutant == "nitrogen dioxide") {
      pollutantNum = 42602
    } else if (pollutant == "sulfur dioxide") {
      pollutantNum = 42401
    } else if (pollutant == "carbon monoxide") {
      pollutantNum = 42101
    } else if (pollutant == "pm10") {
      pollutantNum = 81102
    } else if (pollutant == "pm2.5") {
      pollutantNum = 88101
    }
    one = readline(prompt = "Start year: ")
    one = as.integer(one)
    two = readline(prompt = "End year: ")
    two = as.integer(two)
    k <- lymeCalculate()
    
    p <- intervalCalculation(pollutantNum, one, two)
    s <- influenzaAndPollution(k, p)
    influenzaTTest(s)
    
  } else if (mode == "compare") {
    list <- c()
    for(i in 1:2){
      # update for i
      pollutant = readline(prompt = "enter pollutant: ")
      if (pollutant == "ozone") {
        list <- append(list, 44201)
      } else if (pollutant == "nitrogen dioxide") {
        list <- append(list, 42602)
      } else if (pollutant == "sulfur dioxide") {
        list <- append(list, 42401)
      } else if (pollutant == "carbon monoxide") {
        list <- append(list, 42101)
      } else if (pollutant == "pm10") {
        list <- append(list, 81102)
      } else if (pollutant == "pm2.5") {
        list <- append(list, 88101)
      } else if (pollutant == "uv"){
        list <- append(list, 31415)
      }
    }
    one = readline(prompt = "Start year: ")
    one = as.integer(one)
    two = readline(prompt = "End year: ")
    two = as.integer(two)
    
    p1 <- c()
    p2 <- c()
    
    if(list[1] == 31415){
      p2 <- intervalCalculation(list[2], one, two)
      p1 <- list(uv[[3]][which(uv[[3]] %in% p2[[1]])], uv[[5]][which(uv[[3]] %in% p2[[1]])])
    } else if(list[2] == 31415){
      p1 <- intervalCalculation(list[1], one, two)
      p2 <- list(uv[[3]][which(uv[[3]] %in% p1[[1]])], uv[[5]][which(uv[[3]] %in% p1[[1]])])
    } else{
      p1 <- intervalCalculation(list[1], one, two)
      p2 <- intervalCalculation(list[2], one, two)
    }
    
    goodCounty <- c()
    for (i in 1:length(p1[[1]])) {
      if (length(which(p2[[1]] == p1[[1]][[i]])) > 0) {
        goodCounty <- append(goodCounty, p1[[1]][[i]])
      }
    }
    
    p1[[2]] <- p1[[2]][which(p1[[1]] %in% goodCounty)]
    p2[[2]] <- p2[[2]][which(p2[[1]] %in% goodCounty)]
    
    print("p1 begin")
    print(p1)
    print("p1 end")
    print("p2 begin")
    print(p2)
    print("p2 end")
    
    print(cor(p1[[2]], p2[[2]]))
    plot(p1[[2]], p2[[2]])
    
  } else {
    w = as.integer(readline(prompt = "How many pollutants: "))
    list <- c()
    for (i in 1:w) {
      pollutant = readline(prompt = "Which pollutant: ")
      if (pollutant == "ozone") {
        list <- append(list, 44201)
      } else if (pollutant == "nitrogen dioxide") {
        list <- append(list, 42602)
      } else if (pollutant == "sulfur dioxide") {
        list <- append(list, 42401)
      } else if (pollutant == "carbon monoxide") {
        list <- append(list, 42101)
      } else if (pollutant == "pm10") {
        list <- append(list, 81102)
      } else if (pollutant == "pm2.5") {
        list <- append(list, 88101)
      }
    }
    
    one = readline(prompt = "Start year: ")
    one = as.integer(one)
    two = readline(prompt = "End year: ")
    two = as.integer(two)
    
    multipleRegression(list, one, two)
    
  }
}
