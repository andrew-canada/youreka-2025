library('usmap')

determineNumber <- function(x) {
  tryCatch(
    {
      as.numeric(x)
      return(TRUE)
    },
    warning = function(w) {
      return(FALSE)
    }
  )
}

determineCounty <- function(a, b) {
  tryCatch(
    {
      fips(a, b)
      return(TRUE)
    },
    error = function(e) {
      return(FALSE)
    }
  )
}

betterCoordinates <- function(x, y) {
  x <- 100000*x
  plot(y, x)
  abline(lm(x ~ y))
  print(cor(y, x))
}

multipleRegression <- function(pollutants, startYear, endYear) {
  library(readxl)
  print("hi")
  hasTick <- read.csv('csv-dataset/Public_Use_Ixodes_County_Table_2024_summary.csv')
  print("bye")
  countTick <- list()
  print("henlo")
  for (i in 2:nrow(hasTick)) {
    if (hasTick[i, 4] == "Established") {
      countTick <- append(countTick, as.numeric(hasTick[i, 1]))
    }
  }
  biglist <- list()
  for (i in 1:length(pollutants)) {
    biglist <- append(biglist, list(intervalCalculation(pollutants[[i]], startYear, endYear)))
  }
  print(biglist)
  
  finalList <- c()
  
  for (i in 1:length(biglist[[1]][[1]])) {
    print(biglist[[1]][[1]][[i]])
    check = 0
    if (length(biglist) > 1) {
      for (j in 2:length(biglist)) {
        if (length(which(biglist[[j]][[1]] == biglist[[1]][[1]][[i]])) > 0) {
          check <- check + 1
        }
      }
    }
    if (length(which(countTick == biglist[[1]][[1]][[i]])) > 0) {
      check <- check + 1
    }
    if (check == length(biglist)) {
      print("check!!")
      finalList <- append(finalList, biglist[[1]][[1]][[i]])
    }
  }
  
  print(finalList)
  
  finalbiglist <- list()
  
  cancerRate <- rep(c(-1), each = length(finalList))
  cancer <- read.csv('csv-dataset/LD_Case_Counts_by_County_2023_updated.csv')
  
  for (i in 2:nrow(cancer)) {
    if (length(which(finalList == 1000 * cancer[i, 4] + cancer[i, 5])) > 0) {
      print(1000 * cancer[i, 4] + cancer[i, 5])
      
      cancerRate[[which(finalList == 1000 * cancer[i, 4] + cancer[i, 5])[[1]]]] <- cancer[i, 28]
      
    }
    
  }
  
  print(cancerRate)
  
  pop = read.csv('csv-dataset/co-est2024-alldata.csv')
  
  for (i in 2:nrow(pop)) {
    if (pop[i, 12] != 0) {
      if (length(which(finalList == 1000 * pop[i, 4] + pop[i, 5])) > 0) {
        
        cancerRate[[which(finalList == 1000 * pop[i, 4] + pop[i, 5])[[1]]]] <- cancerRate[[which(finalList == 1000 * pop[i, 4] + pop[i, 5])[[1]]]] / pop[i, 12]
        
      }
      
    }
  }
  
  print(finalList)
  print(cancerRate)
  
  delete <- which(cancerRate < 0)
  finalbiglist <- append(finalbiglist, list(cancerRate))
  print(finalbiglist)
  
  for (i in 1:length(pollutants)) {
    pollutantNum = ""
    if (pollutants[[i]] == 44201) {
      pollutantNum = "Ozone"
    } else if (pollutants[[i]] == 42602) {
      pollutantNum = "Nitrogen Dioxide"
    } else if (pollutants[[i]] == 42401) {
      pollutantNum = "Sulfur Dioxide"
    } else if (pollutants[[i]] == 42101) {
      pollutantNum = "Carbon Monoxide"
    } else if (pollutants[[i]] == 81102) {
      pollutantNum = "PM 10"
    } else if (pollutants[[i]] == 88101) {
      pollutantNum = "PM 2.5"
    }
    finalbiglist <- append(finalbiglist, list(pollutantNum, biglist[[i]][[2]][which(biglist[[i]][[1]] %in% finalList)]))
  }
  
  print(finalList)
  print(finalbiglist)
  
  model <- lm(finalbiglist[[1]] ~ finalbiglist[[3]] + finalbiglist[[5]] + finalbiglist[[7]]  + finalbiglist[[9]]) #+ finalbiglist[[11]] + finalbiglist[[13]])
  print(summary(model))
  
  return(finalbiglist)
  
}

intervalCalculation <- function(pollutant, startYear, endYear) {
  
  list <- list()
  finalCounties <- c()
  finalPollution <- c()
  i = startYear
  sublist <- list()
  if (allPollutionData$has(paste(pollutant, i, sep = ""))) {
    sublist <- allPollutionData$get(paste(pollutant, i, sep = ""))
  } else {
    name <- paste("csv-dataset/daily_", pollutant, "_", i, ".csv", sep = "")
    csv_data <- read.csv(file = name)
    countyCode <- c()
    averageConcentration <- c()
    numOfDays <- c()
    die <- c()
    for (j in 1:nrow(csv_data)) {
      if(determineNumber(csv_data[j, 1])) {
        county =  as.numeric(csv_data[j, 1]) * 1000 + as.numeric(csv_data[j, 2])
        if (length(which(countyCode == county)) > 0) {
          averageConcentration[[which(countyCode == county)[[1]]]] <- averageConcentration[[which(countyCode == county)[[1]]]] + csv_data[j, 17]
          numOfDays[[which(countyCode == county)[[1]]]] <- numOfDays[[which(countyCode == county)[[1]]]] + 1
          die[[which(countyCode == county)[[1]]]] = 1
        } else {
          countyCode <- append(countyCode, county)
          averageConcentration <- append(averageConcentration, csv_data[j, 17])
          numOfDays <- append(numOfDays, 1)
          die <- append(die, 1)
        }
      } else {
        break
      }
    }
    
    delete <- which(die == 0)
    if (length(delete) > 0) {
      countyCode <- countyCode[-c(delete)]
      averageConcentration <- averageConcentration[-c(delete)]
      numOfDays <- numOfDays[-c(delete)]
    }
    averageConcentration <- averageConcentration / numOfDays
    sublist <- list(countyCode, averageConcentration)
    allPollutionData[paste(pollutant, i, sep = "")] <- sublist
  }
  
  list <- append(list, list(sublist))
  
  for (i in 1:length(list[[1]][[1]])) {
    sum <- list[[1]][[2]][[i]]
    finalCounties <- append(finalCounties, list[[1]][[1]][[i]])
    finalPollution <- append(finalPollution, sum)
  }
  print(finalCounties)
  print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
  print(finalPollution)
  return(list(finalCounties, finalPollution))
  
}

influenzaAndPollution <- function(influenza, pollution) {
  
  pollValue <- rep(c(-1), each = length(pollution[[1]]))
  for (i in 1:length(influenza[[1]])) {
    if (length(which(pollution[[1]] == influenza[[1]][[i]])) > 0) {
      pollValue[[which(pollution[[1]] == influenza[[1]][[i]])]][[1]] <- influenza[[2]][[i]]
    }
  }
  
  delete <- which(pollValue == -1)
  noDelete <- which(pollValue != -1)
  
  return(list(pollution[[1]], pollution[[2]], pollValue, delete, noDelete))
  
}

influenzaTTest <- function(biglist) {
  
  countyF <- biglist[[1]][-c(biglist[[4]])]
  pollutionF <- biglist[[2]][-c(biglist[[4]])]
  influenza <- biglist[[3]][-c(biglist[[4]])]
  countyN <- biglist[[1]][-c(biglist[[5]])]
  pollutionN <- biglist[[2]][-c(biglist[[5]])]
  
  print(countyF)
  print("CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC")
  print(pollutionF)
  print("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP")
  print(influenza)
  print("IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII")
  betterCoordinates(influenza, pollutionF)
  
}

lymeCalculate <- function() {
  hasTick <- read.csv('csv-dataset/Public_Use_Ixodes_County_Table_2024_summary.csv')
  countTick <- c()
  for (i in 2:nrow(hasTick)) {
    if (hasTick[i, 4] == "Established") {
      countTick <- append(countTick, as.numeric(hasTick[i, 1]))
    }
  }
  county <- c()
  lymeRate <- c()
  lyme <- read.csv('csv-dataset/LD_Case_Counts_by_County_2023_updated.csv')
  
  for (i in 2:nrow(lyme)) {
    #print(as.numeric(lyme[i, 28]) == 0)
    if (length(which(countTick == 1000 * as.numeric(lyme[i, 4]) + as.numeric(lyme[i, 5]))) > 0) {
      county <- append(county, 1000 * as.numeric(lyme[i, 4]) + as.numeric(lyme[i, 5]))
      lymeRate <- append(lymeRate, as.numeric(lyme[i, 28]))
    }
  }
  
  population <- read.csv('csv-dataset/co-est2024-alldata.csv') 
  delete <- rep(c(0), each = length(lymeRate))
  print(lymeRate)
  
  for (i in 1:nrow(population)) {
    countyCode <- 1000*as.numeric(population[i, 4])+as.numeric(population[i, 5])
    if (length(which(county == countyCode)) > 0) {
      delete[[which(county == countyCode)[[1]]]] <- 1
      lymeRate[[which(county == countyCode)[[1]]]] <- lymeRate[[which(county == countyCode)[[1]]]] / population[i, 12]
    }
  }
  delete <- which(delete != 1)
  return(list(county, lymeRate))
  
}

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
