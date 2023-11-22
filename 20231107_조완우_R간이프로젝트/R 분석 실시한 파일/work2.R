data2018<-read.csv('data_2018',header = T)
data2019<-read.csv('data_2019',header = T)
data2020<-read.csv('data_2020',header = T)
str(data2018)
data2019
str(data2020)   # 38x7
# 가설설정 : 경제성장률과 탄소배출량은 관계가 있다

data2020 <- read.csv('data_2020.csv')

min_max_norm <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}    # min-max  정규화

library(party)  #ctree
library(rpart) 
library(randomForest) 
 
colnames(data2020) <- c("Country", "GDP_2020", "Capita_2020", 
                        "Growth_2020", "CO2_2020", "Capita_2020", "GDP_per_co2_2020")
str(data_2020)
data_2020<-data2020[,c('Country','Growth_2020','CO2_2020')]
dfdata_2020<-data_2020[-27,]
str(dfdata_2020)  # df

data_2020<-data2020[-27,c('Growth_2020','CO2_2020')]
data_2020$CO2_2020<-gsub('\\(kt\\)','',data_2020$CO2_2020)
data_2020

result<- sample(1:nrow(data_2020),nrow(data_2020)*0.7) 
table(result)
train<-data_2020[result,]
test<-data_2020[-result,]
table(train$CO2_2020)
formula<-CO2_2020~Growth_2020
model<-rpart(formula = formula,data = train)
model

str(data_2020)

data_2020[,] <- lapply(data_2020[,], min_max_norm)

# 모델 선택의 기분 : accuracy, 안정성(더 중요)



