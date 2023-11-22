oecd<-read.csv('OECD.csv')
str(oecd)
head(oecd)
dim(oecd)
names(oecd) 

library(dplyr)
oecd <- oecd %>% rename(
  Country = 국가별,
  GDP_2018 = X2018,
  Capita_2018 = X2018.1,
  Growth_2018 = X2018.2,
  Exports_2018 = X2018.3,
  Imports_2018 = X2018.4,
  Population_2018 = X2018.5,
  Unemployment_2018 = X2018.6,
  Consumer_2018 = X2018.7,
  Steel_2018 = X2018.8,
  Internet_2018 = X2018.9,
  
  GDP_2019 = X2019,
  GDP_per_Capita_2019 = X2019.1,
  Growth_2019 = X2019.2,
  Exports_2019 = X2019.3,
  Imports_2019 = X2019.4,
  Population_2019 = X2019.5,
  Unemployment_2019 = X2019.6,
  Consumer_2019 = X2019.7,
  Steel_2019 = X2019.8,
  Internet_2019 = X2019.9,
  
  GDP_2020 = X2020,
  Capita_2020 = X2020.1,
  Growth_2020 = X2020.2,
  Exports_2020 = X2020.3,
  Imports_2020 = X2020.4,
  Population_2020 = X2020.5,
  Unemployment_2020 = X2020.6,
  Consumer_2020 = X2020.7,
  Steel_2020 = X2020.8,
  Internet_2020 = X2020.9
)
names(oecd)

# dplyr 패키지 로딩
library(dplyr)

# 필요없는 행을 제외
oecdf <- oecd %>%
  filter(!Country %in% c("세계", "아시아", "북아메리카", "남아메리카", "유럽","오세아니아","OECD"))

# 결과 확인
head(oecdf)
tail(oecdf)

# Country 기준 내림차순 정렬
oecds<- oecdf%>%
  arrange(Country)

# 결과 확인
head(oecds)



############################################### 탄소배출량량
co2<-read.csv('co2.csv')
str(co2)
head(co2)
names(co2)
dim(co2)

co2 <- read.csv('co2.csv')

# '국가.2.'와 'X2018' 열을 사용하여 새 데이터 프레임 생성
data <- data.frame(Country = co2$국가.2., Emission_2018 = co2$X2018)

# 국가별 이산화탄소 배출량 출력
print(data)


# 데이터 불러오기
co2 <- read.csv('co2.csv')

# 열 이름 설정
names(co2) <- c(
  "Country_Level1",
  "Country",
  "CO2_2018",
  "Capita_2018",
  "GDP_2018",
  "CO2_2019",
  "Capita_2019",
  "GDP_2019",
  "CO2_2020",
  "Capita_2020",
  "GDP_2020"
)

# 변경된 열 이름 확인
print(names(co2)) 
co2data<-co2[-2,-1]
co2data

merged_data <- merge(oecds, co2data, by="Country", all=FALSE)
str(merged_data)

############## 2018년
data_2018 <- merged_data[, c("Country", "GDP_2018.x", "Capita_2018.x", 
                             "Growth_2018", "CO2_2018", "Capita_2018.y", "GDP_2018.y")]
print(data_2018) 
colnames(data_2018) <- c("국가", "2018년 GDP", "2018년 인당GDP", 
                         "2018년 경제성장률", "2018년 탄소배출량", "2018년 1인당 이산화탄소배출량", "2018년 GDP 달러당 이산화탄소배출량")
str(data_2018) 

# '2018년 GDP' 열을 숫자로 변환
data_2018$`2018년 GDP` <- as.numeric(as.character(data_2018$`2018년 GDP`))

library(dplyr)

# `2018년 GDP`, `2018년 인당GDP`, `2018년 경제성장률` 열을 숫자로 변환
data_2018 <- data_2018 %>%
mutate_at(vars(`2018년 GDP`, `2018년 인당GDP`, `2018년 경제성장률` ), 
            ~as.numeric(as.character(.)))


# '2018년 GDP' 기준으로 정렬
data_2018 <- data_2018 %>% arrange(`2018년 GDP`)

## csv로 저장
write.csv(data_2018, file="data_2018" , row.names = F)

############## 2019년
data_2019 <- merged_data[, c("Country", "GDP_2019.x", "GDP_per_Capita_2019", 
                             "Growth_2019", "CO2_2019", "Capita_2019", "GDP_2019.y")]

colnames(data_2019) <- c("국가", "2019년 GDP", "2019년 인당GDP", 
                         "2019년 경제성장률", "2019년 탄소배출량", "2019년 1인당 이산화탄소배출량", "2019년 GDP 달러당 이산화탄소배출량")
str(data_2019) 

data_2019 <- data_2019 %>%
  mutate_at(vars(`2019년 GDP`, `2019년 인당GDP`, `2019년 경제성장률` ), 
            ~as.numeric(as.character(.)))

## csv로 저장
write.csv(data_2019, file="data_2019" , row.names = F)

############## 2020년
data_2020 <- merged_data[, c("Country", "GDP_2020.x", "Capita_2020.x", 
                             "Growth_2020", "CO2_2020", "Capita_2020.y", "GDP_2020.y")]

colnames(data_2020) <- c("국가", "2020년 GDP", "2020년 인당GDP", 
                         "2020년 경제성장률", "2020년 탄소배출량", "2020년 1인당 이산화탄소배출량", "2020년 GDP 달러당 이산화탄소배출량")
str(data_2020) 

library(dplyr)

data_2020 <- data_2020 %>%
  mutate(across(c(`2020년 GDP`, `2020년 인당GDP`, `2020년 경제성장률`),
                ~as.numeric(gsub("[^0-9.]", "", as.character(.)))))

data_2020$`2020년 탄소배출량` <- as.numeric(gsub("\\(kt\\)", "", data_2020$`2020년 탄소배출량`))
data_2020$`2020년 1인당 이산화탄소배출량`<- as.numeric(gsub("\\(metric tons per capita\\)", "", data_2020$`2020년 1인당 이산화탄소배출량`))
data_2020$`2020년 GDP 달러당 이산화탄소배출량` <- gsub("[^0-9\\.]", "", data_2020$`2020년 GDP 달러당 이산화탄소배출량`)
data_2020$`2020년 GDP 달러당 이산화탄소배출량` <- as.numeric(data_2020$`2020년 GDP 달러당 이산화탄소배출량`)

## csv로 저장
write.csv(data_2020, file="data_2020" , row.names = F)



########################## 데이터 분석################################
str(data_2020)

TrainData <- data_2020[, -which(names(data_2020) == '2020년 탄소배출량')]

length(TrainClasses_factor)
nrow(TrainData)

TrainClasses_factor <- TrainClasses_factor[1:nrow(TrainData)]

 
TrainClasses_numeric <- as.numeric(as.character(TrainClasses))
breaks <- quantile(TrainClasses_numeric, probs = c(0, 0.33, 0.66, 1))

sum(is.na(TrainData))
sum(is.na(TrainClasses_factor))


data_2020 <- na.omit(data_2020)
 
TrainClasses <- data_2020$`2020년 탄소배출량`



# featurePlot에 범주형 변수 사용
library(caret) 
featurePlot(TrainData, TrainClasses_factor, plot = "density",
            auto.key = list(columns=3))

########################## knnFit1 훈련시키기  knn모델로 분석 ################################
knnFit1 <- train(TrainData, TrainClasses_factor, method = "knn", 
                 tuneLength = 20, trControl = trainControl(method = "cv", 
                                                           classProbs = TRUE, summaryFunction = twoClassSummary), 
                 metric = "Accuracy")


#  예측 및 혼동 행렬 생성
knnPredict <- predict(knnFit1, newdata = TrainData)
confMat <- confusionMatrix(knnPredict, TrainClasses_factor)
print(confMat)

# Accuracy : 0.5676 정확도 낮음 k선택이나 변수선택이 잘못되었을 수 있음음
# 실패로 볼수 있음 의사결정트리, 랜덤 포레스트, 로지스틱 회귀등을 시도해볼 예정

########################## 의사결정 트리 모델로 데이터 분석################################

library(rpart)
library(party)
library(caret)
# 결측치 처리
library(rpart)

# 회귀 트리 모델 생성
formula <- `2020년 탄소배출량` ~ `2020년 경제성장률` + `2020년 GDP`
regression_tree <- rpart(formula, data = train, method = "anova")

# 트리 모델 시각화
plot(regression_tree, uniform=TRUE, main="Regression Tree for 2020년 탄소배출량")
text(regression_tree, use.n=TRUE, all=TRUE, cex=.8)

# 테스트 데이터에 대한 예측
predictions <- predict(regression_tree, test)

# 실제값
actuals <- test$`2020년 탄소배출량`

# RMSE 계산
rmse <- sqrt(mean((predictions - actuals)^2))
print(paste("RMSE:", rmse))

# MAE 계산
mae <- mean(abs(predictions - actuals))
print(paste("MAE:", mae))

# R-squared 계산
sst <- sum((actuals - mean(actuals))^2)
sse <- sum((predictions - actuals)^2)
rsquared <- 1 - (sse/sst)
print(paste("R-squared:", rsquared))
#"R-squared: -4.90164677121832" 0~1 사이여야 하는 R-squared가 데이터가 -4.9로 오류가 나옴옴
# 내가 보기엔 두개의 데이터를 한꺼번에 전처리하는데서 오는 문제가 발생한듯 보임
