
#install.packages("party")
library(party) # ctree 모델을 갖고있음
# 문제의 발견  : 꽃잎의 크기와 넓이 그리고 꽃받침의 크기와 넓이가 
# 나팔꽃의 종을 구분 할 수 있을것이다 (가설설정)
# 대상을 관찰: 결과데이터를 검색
dim(iris) # 150 5 : 범주 ( 3개)
# 훈련데이터 / 테스트 데이터를 분리하는 이유: 과적합을 방지하기 위해서
# 평가 
# 데이터 행열로 이루어진 데이터 
# 종속변수가 결정이 되어있는 데이터 
# 어떤 데이터를 넣어도 가능함
# 
(result <- sample(1: nrow ( iris) , nrow(iris) * 0.7)) # 70% train : 30% test
table(result)
train <- iris[result,]
test <- iris[-result,]
head(train)
class(train)
class(iris_ctree)
# Species 종속변수Sepal.Length + Sepal.Width + Petal.Length + Petal.Width 4개의 변수를 고려해서 예측모델 만들어라
formula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
iris_ctree <- ctree(formula, data = train)
iris_ctree
plot(iris_ctree, type="simple")
plot(iris_ctree)
# test :45 개중에서
# 
pred <- predict(iris_ctree,test)
pred
(tr<-table(pred, test$Species))
paste(round(sum(diag(tr))/ nrow(test)*100), '%') #(diag(tr)) 대각선만 빼오는것 
# R에서 paste 문자열 결합함수 
#



# 문제 : 노드 7 숫자빼와라
formula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
train <- iris[result,] 


suset  <- train[train$Petal.Length > 1.9 & train$Petal.Width > 1.7, ]

iris_ctree2 <- ctree(formula, data = suset )

plot(iris_ctree2, type="simple")
plot(iris_ctree2)

pred <- predict(iris_ctree2,test)
pred
(tr<-table(pred, test$Species))
paste(round(sum(diag(tr))/ nrow(test)*100), '%')  

# 행선택
result  <-  subset(train, Petal.Length > 1.9 &  Petal.Width > 1.7)
dim(result)
table(result$Species)

library(dplyr)
refilter<- train %>% 
  filter(Petal.Length > 1.7 & Petal.Width > 1.7)
nrow(refilter)
dim(refilter)
 
#install.packages("arules")
library(arules)
?AdultUCI
data("AdultUCI")
str(AdultUCI) # 48842 * 15
names(AdultUCI) # 데이터 자체는 종속변수 : income , 독립변수 : 14
class(AdultUCI)
choice <- sample(1:nrow(AdultUCI), 10000)
choice
adult.df <- AdultUCI[choice, ]
adult.test <- AdultUCI[-choice, ]
str(adult.df)
(adult_df<- adult.df[, c('capital-gain', 'income', 'education-num', 
                         'hours-per-week' , 'race' , 'age')])
colnames(adult_df) <- c("capital", 'income', 'education', 
                        'hours' , 'race' , 'age') 

str(adult_df)
# 자본이득 : 변수선택으로 바꿈
formula <- capital ~ income + education + hours + race + age
adult_ctree <- ctree(formula, data = adult_df) # party 패키지 , rpart 패키지
adult_ctree
plot(adult_ctree)

png("adult_ctree.png", res = 80, hegiht= 800, width = 1600)
#res = resolution 해상도 : 출력하기 위해서 : dot per inch 
plot(adult_ctree)
dev.off()
# tree 분석의 문제점
# 데이터의 열을 변경하면 결과도 달라짐
# 과적합( 훈련데이터의 모델이 과도하게 적합한다 )
# 일반화가 어려워진다 (훈련데이터에 과적합되어서)
# 검정을 할 수가 없음
# Random Forest 모델을 이용해서 여러개의 모델( 500~ 1000)
# 이산적 : 투표, 연속적인 경우 : 모델결과를 평균을 해서 예측
# 앙상블 Ensemble 학습 (여러개의 모델이 협력해서 학습)
# 여러개의 모델에서는 많은데이터가 필요 : bootstrap 부스팅 증폭한다
# 데이터를 추가로 더만드는게 부트스트랩 한다
# Bagging : bootstrap + aggregation
# Boosting ( 증폭한다, 강력하게한다)
# Adaboost 약한 모델을 강력하게 한다(5~6 모델을 더 강력하게)
    # 잘못 분류된 데이터를 위해 모델을 만들고 이전 모델과 결합해서
    # 문제를 해결하는 모델
# Gradient : 점진적으로 
# 오류가 난 부분을 점진적으로 개선 -> 좋은 모델
# GradinetBoost
# XGBoost = GradientBoost + GPU사용 + 언어 호환성
# Python sklearn 패키지하고 잘 어울릴 수 있도록 패키지를 준비한다

#동전 : 앞면 : 0.4 뒷면: 0.6 
x1 <- 0.4
x2 <- 0.6
-x1 * log(x1) - x2 * log(x2) # 0.6730117 엔트로피 지수
# 정보이득 (information gain (IG))

#install.packages("rattle")
library(rpart)
library(rpart.plot)
library('rattle')
result <- sample(1 : nrow(iris), nrow(iris)*0.7)


train <- iris[result,]
test <- iris[-result,] 
test
dim(train); dim(test) #105   5 , 45  5
table(train$Species)  #39         35         31 
formula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
model<-rpart(formula = formula, data = train)
model
#plot(model, type ="simple")
prp(model)
rpart.plot(model)
fancyRpartPlot(model)
(pred2<- predict(model, test, type="class"))
pred <- predict(model,test)
pred
dim(pred) #45 x 3
cpred <- ifelse(pred[,1] >= 0.5, "setosa",
                ifelse(pred[,2]>=0.5, "versicolor", "virginica"))
cpred


# 문제 : 정분류율 , 오분류율을 계산하시오
# TEST 데이터에 대해서 계산
# 표를 구성
tb= table(cpred, test$Species) 
tb
diag(tb)
 sum(diag(tb))/ sum(tb)
# 정분류가 0.95 정확도
 1- (sum(diag(tb))/ sum(tb))
# 오분류가  0.04 오분류율
diag(diag(tb))
tb - diag(diag(tb))
sum(tb-diag(diag(tb))) / nrow(test) 
# 행은 개인 데이터 개수 , 열은 변수

wdbc<-read.csv('wdbc_data.csv')
str(wdbc)
# diagnosis 진단  : B -> 양성 , M -> 악성
unique(wdbc$diagnosis) # "B" "M"
wdbc <- wdbc[-1]
# diagnosis 변수를 팩터로 변환하고 레벨을 설정합니다.
wdbc$diagnosis <- factor(wdbc$diagnosis, levels = c("B" ,"M"))
#rpart로 모델 구현


# 파일을 읽을 때 header=TRUE 옵션을 사용하여 첫 행을 변수 이름으로 인식합니다.
wdbc <- read.csv('wdbc_data.csv', header = TRUE)

# 데이터의 구조를 확인합니다.
str(wdbc)

# rpart로 모델을 구현하기 위해 데이터의 구조를 확인합니다.
str(wdbc)


# rpart로 모델을 구현
formula <- diagnosis ~ radius_mean + texture_mean + area_mean + smoothness_mean + compactness_mean + 
  concavity_mean + points_mean + concavity_se + points_se + symmetry_se + dimension_se + radius_worst + 
  texture_worst + perimeter_worst + area_worst + smoothness_worst + compactness_worst + concavity_worst + 
  points_worst + symmetry_worst + dimension_worst

dd <- rpart(formula=formula, data = wdbc)
dd


# rpart.plot 함수로 모델을 시각화합니다.
rpart.plot(dd)

# 정규화 : 변수간에 종속변수에 대한 동등한 영향력을 가질 수 있도록 함
normalize<-function(x){
  return (x-min(x)) / (max(x) - min(x))}
# min-max 정규화
#모든 열에 함수를 처리하는 것 (apply 계열 함수)
#lapply, sapply()
# DT에서 범주형 / 연속형에 다 사용가능(사이즈가 동일한 상태에서 분산의 크기) 
(wdbc_x <- as.data.frame(lapply(wdbc[2:31], normalize)))
summary(wdbc_x)
wdbc_df <- data.frame(wdbc$diagnosis, wdbc_x)
dim(wdbc_df)


idx = sample(nrow(wdbc_df), 0.7 * nrow(wdbc_df))
wdbc_train = wdbc_df[idx, ]
wdbc_test = wdbc_df[-idx, ]
head(wdbc_train) # wdbc.diagnosis (병합할때 $-> .으로 변경해서 명명)

# 모델 구성(formula에서 .의 의미는 나머지 다)
model2<- rpart(wdbc.diagnosis~., data = wdbc_train)
model2
rpart.plot(model2)

#모델 평가는 테스트 데이터로
(pred2<- predict(model2, wdbc_test, type="class"))
str(wdbc_test)
(res<-table(pred2,wdbc_test$wdbc.diagnosis))
acc<-sum(diag(res))/sum(res) #accuracy
1- acc # 오분류율
# 정밀도  96
paste(round(res[1,1]/sum(res[1, ])*100),'%')
# 재현율(민감도) 91
paste(round(res[1,1]/sum(res[ ,1])*100),'%')
# 특이도 94
paste(round(res[2,2]/sum(res[ ,2])*100),'%')


#install.packages("caret")
library(caret)
confusionMatrix(pred2, wdbc_test$wdbc.diagnosis)
#Kappa : 0.8433 똑같은걸 두명이 했을때 일치할 확률 높을수록 잘만든것
# Mcnemar's Test P-Value 맥너머 테스트
# 귀무가설: 두 범주는 관련이 없다.
# 대립가설: 두 범주는 관련이 있다.

#######RandomForest
# 태동동기  : DT열이 달라지면 결과가 달라지는 단점 극복
#           : DT의 과적합 극복하기 위해서
# ensemble 학습 : 두개 이상이 모델을 학습시켜 그 결과를 
#                 이산적인 경우에는 투표, 연속적인 경우에는 평균
# bootstrapping : 많은 데이터를 생성하기 위해서 기존 데이터의 조합
# bagging : bootstrapping을 해서 만든 모델의 결과를 aggregation
# voting : 상이한 모델을 여러개를 학습한 다음 그 결과를 투표, 평균
# 

#install.packages("randomForest")
library(randomForest)
library(rpart)
data(iris)
model = randomForest(Species~. , data=iris)# .의 의미는 나머지 다
model # 트리가 500개의 트리 모델 , 2개의 변수
model = randomForest(Species~., data = iris, ntree= 300, mtry=4, # mtry=4 이게 사람이 결정해야할 값
                     na.action = na.omit) # 300개의 트리를 4개의 변수로 모델을 만들어라

model
#hyper parameter : 기계가 결정하지 않고 분석가가 결정해야 하는 변수
#튜닝 tuning해서 좋은 파라미터를 결정해야한다
ntree <- c(400,500,600) # 9가지 경우의 수가 발생
mtry <- c(2:4)
param <- data.frame(n=ntree, m=mtry)
param
for(i in param$n){
  cat('ntree= ', i, '\n')
  for(j in param$m){
    cat('mtry= ', j, '\n')
    model = randomForest(Species~.,data= iris,
                         ntree=i, mtry=j,
                         na.action = na.omit)
    print(model)
    }
}

#               Number of trees: 400
# No. of variables tried at each split: 4
# 변수 중요도를 출력
model3 = randomForest(Species~ ., data = iris, ntree=400, mtry=4,
                      importance= T, na.action = na.omit)

model3
importance(model3)
# rpart : Gini 지수 지니지수
# MeanDecreaseAccuracy(정확도의 개선에 기여하는 변수)
# MeanDecreaseGini(불순도의 개선에 기여하는 변수)
(model3$importance)
varImpPlot(model3)

pred<-model3$predicted
table(pred, iris$Species)

# 문제 
#weatherAUS
?weatherAUS
# 데이터 설명 : 내일 비가 올 것인가  안올것인가?
# RainTomorrow
# 1. 데이터를 로딩하시오
waus<-read.csv('weatherAUS.csv')
waus
ncol(waus)
colnames(waus)
str(waus)
summary(waus)
# 2. 학습에 부적한 데이터를 제거하시오

# 여러 열을 제거
#열들을_제거할_리스트 = ['Location', '열2', '열3']
#df = df.drop(열들을_제거할_리스트, axis=1)
#waus_dr <- waus[c('Date','RISK_MM','Location','RainToday')]

# 선택한 열 제거
waus_dd <- waus[, !(names(waus) %in% c('Location', 'Date', 'RISK_MM','RainToday'))]

# 데이터프레임 구조 확인
str(waus_dd)

# 데이터프레임 요약 확인
summary(waus_dd)

# 3. sampling(7:3) 하시오
waus_dd <- na.omit(waus_dd)

# 숫자열 선택
numeric_columns <- sapply(waus_dd, is.numeric)
numeric_data <- waus_dd[, numeric_columns]

# 정규화 함수 정의
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

# 숫자열에 대해 Min-Max 정규화 적용
normalized_data <- as.data.frame(lapply(numeric_data, normalize))

# 정규화된 데이터를 원래 데이터프레임에 추가
waus_dd[, numeric_columns] <- normalized_data

# 결과 출력
print(waus_dd)

# 이제 부터 문제 해결 0.7 샘플링링
idx = sample(nrow(waus_dd), 0.7 * nrow(waus_dd))
waus_train = waus_dd[idx, ]
waus_test = waus_dd[-idx, ]
head(waus_train)


# 모델 구성(formula에서 .의 의미는 나머지 다) 
# 0.7 샘플링을 통해 생성한 훈련 데이터를 기반으로 모델 구성
modelwa <- rpart(RainTomorrow ~ ., data = waus_train)
modelwa

#모델 평가는 테스트 데이터로
(pred3<- predict(modelwa, waus_test, type="class"))
str(waus_test)

# 4. randomForest 모델을 이용해서 분류 모델을 구축하시오
# -  최적의 tree 수와 mtry개수를 hyper parameter tuning


library(randomForest)
library(rpart)
 
waus_dd$RainTomorrow <- as.factor(waus_dd$RainTomorrow)

modelww <- randomForest(RainTomorrow ~ ., data = waus_dd)

modelww  
modelww = randomForest(RainTomorrow~., data = waus_dd, ntree= 300, mtry=10, # mtry=4 이게 사람이 결정해야할 값
                     na.action = na.omit) # 300개의 트리를 4개의 변수로 모델을 만들어라

model
#hyper parameter : 기계가 결정하지 않고 분석가가 결정해야 하는 변수
#튜닝 tuning해서 좋은 파라미터를 결정해야한다
ntree <- c(400,500,600) # 9가지 경우의 수가 발생
mtry <- c(2:4)
param <- data.frame(n=ntree, m=mtry)
param
for(i in param$n){
  cat('ntree= ', i, '\n')
  for(j in param$m){
    cat('mtry= ', j, '\n')
    modelww = randomForest(RainTomorrow~.,data= waus_dd,
                         ntree=i, mtry=j,
                         na.action = na.omit)
    print(modelww)
  }
}

#               Number of trees: 400
# No. of variables tried at each split: 4
# 변수 중요도를 출력
modelwt = randomForest(Species~ ., data = iris, ntree=400, mtry=4,
                      importance= T, na.action = na.omit)

modelwt
importance(modelwt)
# rpart : Gini 지수 지니지수
# MeanDecreaseAccuracy(정확도의 개선에 기여하는 변수)
# MeanDecreaseGini(불순도의 개선에 기여하는 변수)
(modelwt$importance)
varImpPlot(modelwt)

pred<-modelwt$predicted
table(pred, waus_dd$RainTomorrow)

library(caret)
confusionMatrix(pred2, wdbc_test$wdbc.diagnosis)


# 5. 모델에 test를 입력해서 예측한 데이터로 평가하시오

library(randomForest)
library(rpart)
weatherAUS = read.csv(file.choose())
weatherAUS$WindGustDir<- as.factor(weatherAUS$WindGustDir)
weatherAUS$WindDir9am <- as.factor(weatherAUS$WindDir9am)
weatherAUS$WindDir3pm <- as.factor(weatherAUS$WindDir3pm)
weatherAUS$RainTomorrow <- as.factor(weatherAUS$RainTomorrow)

#문자열을 로딩하면서 범주형으로 변환
weatherAUS=read.csv("./weatherAUS.csv", stringsAsFactors = T)
str(weatherAUS)
head(weatherAUS)
is.vector(unlist(lapply(weatherAUS,class)))
result<- sapply(weatherAUS, class)
is.vector(result)

weatherAUS=weatherAUS[,c(-1,-2,-22,-23)]
sum(is.na(weatherAUS))
weatherAUS<-na.omit(weatherAUS)
dim(weatherAUS)
set.seed(123)

result <- sample(1:nrow(weatherAUS), nrow(weatherAUS) * 0.7)
train <- weatherAUS[result,]
test <- weatherAUS[-result,]

dim(train) #105   5
dim(test) # 45  5

rain = randomForest(RainTomorrow~., data=train, ntree=100, mtry=2,
                    importance=T, na.action = na.omit)
rain
rainp1 <- predict(rain, newdata = test)
head(rainp1)
table(rainp1, test$RainTomorrow)

ntree <- c(200, 300, 400, 500, 600)
mtry <- c(6:10)
param <- data.frame(n=ntree, m=mtry)
param
for(i in param$n){
  cat('ntree= ', i, '\n')
  for(j in param$m){
    cat('mtry= ', j, '\n')
    rain = randomForest(RainTomorrow~.,data= train,
                           ntree=i, mtry=j,
                           na.action = na.omit)
    print(rain)
  }
}

registerDoParallel(cores=4)
getDoParWorkers()
system.time(
  rf_weather <- foreach(ntree = c(200), .combine=combine,
                        .packages= 'randomForest',.multicombine=TRUE) %dopar%
    randomForest(RainTomorrow~., data=train,
                 ntree=ntree , mtry=8, importance=T, na.action=na.omit)
        )

rf_weather
pred <- predict(rf_weather, newdata =test) # 가장좋은 파라미터의 모델사용
tb<- table(pred, test$RainTomorrow)
library(caret)
(c<-confusionMatrix(pred, test$RainTomorrow))
importance(rf_weather)
varImpPlot(rf_weather)
