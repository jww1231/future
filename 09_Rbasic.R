#문제 
#데이터의 열간 거리와 행간거리를 구해보시오

var1 <- c(20,30,90)
var2 <- c(80,44,40)
person1 <- c(20,80)
person2 <- c(30,44)
person3 <- c(90,40)

data <- data.frame(var1, var2)
data 

# Minkowski거리 : 유클리디안 거리(2) -> k승
# Cosine 유사도 = 내적 / |A|x|b|
# Cosine 비유사도 = 1 - cosine 유사도

sqrt((20-80)^2+(30-44)^2+(90-40)^2) #열간거리
sqrt((20-30)^2+(80-44)^2 ) # 행간거리
((20-90)^3+(80-40)^3)^(1/3)

# Mahalanobis 마할라노비스 거리(object detection-> object tracking)

# 군집분석(kmean clustering)
vec<- c(1,2,3,4)
sqrt(sum(vec^2))

#install.packages("lsa")

library(lsa)
# 각도를 유사도의 크기로 표현하기 위해서
# cosine 유사도 : 코싸인을 사용하는 이유는 0일때 1이라서 
# 0도는 두 데이터가 같은 방향을 봄 : 그래서 유사도가 크다(1로 표현)
# 숫자가 크면 더 유사하다
vec1 = c( 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 )
vec2 = c( 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0 )
vec3 = c( 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0 )
cosine(vec1,vec2) # 0.2357023
matrix = cbind(vec1,vec2,vec3)
cosine(matrix) # 정방행렬 대칭행렬 : 공분산행렬, 상관계수 행렬, 거리값행렬, 유사도 행렬

vec1 %*% vec2 # 벡터내적 : 벡터의 크기가 고려된 사이각

(x <- matrix(1:16, nrow=4))
sqrt(sum((x[1,] - x[4,])^2))
sqrt(sum((x[,1] - x[,4])^2))
(dist <- dist(x, method = "euclidean")) # 4x4 => 3x3
(dist <- dist(x, method = "minkowski",p = 2))
(dist <- dist(x, method = "manhattan")) # 직선거리 

# Hierachical clustering 계층적 군집 분석
# 탐색적 (Explarotory) 클러스터링( 군집수를 결정하기 위해서 )
idx = sample(1:dim(iris)[1],40)
irisSample = iris[idx,]
species <- irisSample$Species # 백업
irisSample$Species = NULL #열 삭제(범주형)
?hclust
#"ward.D", "ward.D2"  # ward:군집내 편차의 제곱합을 고려해서 거리값을 잰다. 
#"single", "complete" : 가장 먼지점, "average" (= UPGMA),
#"mcquitty" (= WPGMA), "median" (= WPGMC) or "centroid" (= UPGMC).

hc= hclust(dist(irisSample), method="ave") # 계층적 @@@@@@@@@@@@@@@@@@@@@@ method="ave"이게 시험에 잘나옴
#dist(irisSample) 거리값으로 표현된 행렬(정방, 대칭)
#일반화 함수
plot(hc, hang = -1, labels = iris$Species[idx]) # 계층적
rect.hclust(hc, k=3) 
(groups = cutree(hc, k=3))
table(groups, species) # 40개의 데이터에 대한 그룹번호 출력
  
# K means 
# K개의 군집과  k개의 중심값을 결정
# 모든 요소의 중심값과의 거리값을 계산
# 가장 가까운 군집에 할당
# 집단별 중심값을 재계산
# 반복과정 속에서 WSS(within sum of square)값을 최소화 해 가는 알고리즘
# 군집 분석을 할때는 열별 중요도를 같게 하기 위해서 scaling 을 실시
set.seed(1)
iris_back <-iris
iris_back$Species <-NULL
iris.scaled <- scale(iris_back[,-5])
(kmeans.result<-kmeans(iris.scaled,3,trace=TRUE)) # K범주의 개수 == 3
table(iris$Species , kmeans.result$cluster) # 결과 비교 : 확인
plot(iris.scaled[,c('Sepal.Length','Sepal.Width')],
     xlim=c(-2,2),ylim=c(-2,2),col=kmeans.result$cluster)
# 센터 포인트 : 
points(kmeans.result$centers[,c('Sepal.Length','Sepal.Width')],
       col=1:3,pch=10,cex=10)

?kmeans
names(kmeans.result)
iris$Species # 3개가 존재  1 : setosa, 2: versicolor 3:viginica
#Species : 종속변수, 4개의 독립변수 : 
kmeans.result$cluster # 결정된 그룹 :  setosa : 3 3번이->2번이됨
iris_back$pred <- kmeans.result$cluster
sum(iris_back$Species == iris_back$pred)
kmeans.result$centers # 중심값 == 군집을 대표하는 특성
# 평균으로 집단을 이해한다
kmeans.result$iter # 중심재계산 회수
kmeans.result$size # 군집별 개수
kmeans.result$totss # total sum of square 차의 제곱의 합
# 거리 :  군집내 거리(각데이터 + center)
# 군집간 거리
sum(kmeans.result$withinss) + sum(kmeans.result$betweenss)
km.res <- kmeans(iris.scaled, 3, nstart = 10)
#install.packages("factoextra")
library(factoextra)
fviz_cluster(km.res, iris[,-5], ellipse.type = "norm")

# catet 패키지 : 자동화 도구
library(caret)
set.seed(123)
inTrain<- createDataPartition(y=iris$Species, p=0.7, list=FALSE)
# createDataPartition # bootstrap데이터,
# cross validation : 데이터 분할 : train/ test(0)
# 10 그룹으로 분할하고 : 10개를 각기 test로 활용 
training <- iris[inTrain,]
testing <- iris[-inTrain,]
training.data <- scale(training[-5])
summary(training.data)
# 중심재계산의 회수를 10000으로 제한
iris.kmeans <- kmeans(training.data[,-5], centers = 3, iter.max = 10000)
training$cluster <- as.factor(iris.kmeans$cluster)
qplot(Petal.Width, Petal.Length, colour=cluster, data=training)

# k개수의 결정
wssplot <- function(data, nc =15 , seed = 1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed) # y축은 군집내거리의 합계 : 군집내 응집도가 커짐
    wss[i] <- sum (kmeans(data, centers = i)$withinss)
    kmeans(data,centers = i)$withinss
  }
  plot(1:nc, wss, type = "b", xlab = "클러스터수", ylab = "SS")
}
wssplot
wssplot(training.data) # elbow 4개가 적당하다

# 문제 
# bodycheck.csv : 중1년 신체검사 결과
# hclustering을 실시하시오

body<-read.csv('bodycheck.csv')
str(body)
dim(body)
idx = sample(1:dim(body)[1],10)
bodySample = body[idx,]
glass <- bodySample$안경유무 # 백업
bodySample$안경유무 = NULL #열 삭제(범주형)
?hclust
#"ward.D", "ward.D2"  # ward:군집내 편차의 제곱합을 고려해서 거리값을 잰다. 
#"single", "complete" : 가장 먼지점, "average" (= UPGMA),
#"mcquitty" (= WPGMA), "median" (= WPGMC) or "centroid" (= UPGMC).

hc= hclust(dist(bodySample), method="ave") # 계층적 @@@@@@@@@@@@@@@@@@@@@@ method="ave"이게 시험에 잘나옴
#dist(irisSample) 거리값으로 표현된 행렬(정방, 대칭)
#일반화 함수
plot(hc, hang = -1, labels = body$glass[idx]) # 계층적
rect.hclust(hc, k=3) 
(groups = cutree(hc, k=3))
table(groups, glass)

##선생님 정답
body<-read.csv('bodycheck.csv',header = T, encoding = "UTF-8")
names(body)
idist <- dist(body[,-1])
hc<- hclust(idist)
plot(hc,hang = -1)

res <- rect.hclust(hc, k=3, border = "red")
attach(body)
(g1<- subset(body, "번호" == 10 | "번호"== 4| "번호" == 8 |"번호"== 1|"번호"==15))
(g2<- subset(body, "번호" == 11 | "번호"== 3| "번호" == 5 |"번호"== 6|"번호"==14))
(g3<- subset(body, "번호" == 2  | "번호"== 9| "번호" == 13|'번호'== 7| 번호 ==12)) # ' " 안해도 모두 같음 

# 
sns<-read.csv('snsdata.csv',header = T, encoding = "UTF-8")
str(sns)
names(sns)
# sns 계정을 가진 30000명 청소년을 대상으로 4개의 기본데이터
# 36개의 관심분야에 대해 수집된 정보
# 성향분석 : 5개의 그룹으로 분류하는 코미디
# 범죄성향, 운동성향, 외모지향, 무기력, 브레인 이런 5가지로 clustering해보자

teens <- read.csv("snsdata.csv")
set.seed(100)
str(teens)
head(teens)
sum(is.na(teens)) #7810개
colSums(apply(teens , 2, is.na)) # gender / age / 2724 / 5086
sum(is.na(teens$friends))
table(teens$gender) # F 22054 M 5222
summary(teens$age) 
teens$age <- ifelse(teens$age >= 13 & teens$age < 20 ,teens$age, NA)
summary(teens$age) # 5523
#졸업연도를 기준으로 한 평균

(avg <- ave(teens$age, teens$gradyear, FUN = function(x) mean(x, na.rm = T)))
teens$age <- ifelse(is.na(teens$age), avg , teens$age)
teens$age[1:6]
summary(teens$age)

#4개의 기본정보
interests<-teens[5:40]
summary(interests)
interests_n <- data.frame(lapply(interests, scale))
teen_clusters <- kmeans(interests_n, 5)
names(teen_clusters)
teen_clusters$cluster[1:5]
teen_clusters$size # 600   731 22329  1056  5284

# 군집별 특성
round(teen_clusters$centers * 100)
# 1번 그룹 : 브레인
# 2번 그룹 : 운동지향적
# 3번 그룹 : 무기력
# 4번 그룹 : 범죄지향적
# 5번 그룹 : 외모지향적

(medians <- apply(teen_clusters$centers, 2, median))

teens$cluster <- teen_clusters$cluster
aggregate(data = teens, age ~ cluster, mean) # age ~ cluster, mean  : 클러스터별 나이의 평균 
qplot(cluster,age,colour=gender,data=teens)
(res <- aggregate(data= teens, gender=='F' ~ cluster, mean))
# 여성이 소프트볼 발리볼 헤어스타일 드레스에 대한 관심이 더 높다
aggregate(data= teens, softball + volleyball + hair + dress ~ gender == 'F', mean)
aggregate(data= teens, sex + die + drunk ~ bible > 0, mean)
# 종교여부
aggregate(data= teens, shopping~ cluster, mean)

# 문제 남자는 음악과 드레스에 관심이 많은가?  거짓 FALSE     0.9063662  TRUE     0.7232861
aggregate(data= teens, music + dress ~ gender == 'M', mean)

#남자는 음주와 마약에 관심이 많은가? 거짓 FALSE     0.1592908  TRUE     0.1304098
aggregate(data= teens, drunk  + drugs  ~ gender == 'M', mean)

#여자는 야구 + 스포츠에 관심이 많은가?  거짓  FALSE   0.4712754  TRUE         0.2046341
aggregate(data= teens, baseball  + sports  ~ gender == 'F', mean)

names(teens)
# 3가지 스스로 찾아서 분석
# 종교에 따른 음악의 선호도는? 종교가 있으면 음악을 선호한다  FALSE 0.7312942  TRUE 1.1425577
aggregate(data= teens, music~ bible > 0, mean) 
# 나이 15세를 기준으로 마약과 술의 선호도는?  참이 약간우세   FALSE     0.1544715 TRUE     0.1546768
factor(teens$gradyear) 
factor(teens$age) 
aggregate(data= teens, drunk  + drugs~ age > 16.5, mean) 

# 남자는 큐트와 섹시에 관심이 많은가? 거짓  FALSE   0.5505577   TRUE   0.1535810
aggregate(data= teens, cute  + sexy  ~ gender == 'M', mean)


# 데이터 요약 :  1단계 분석

# DTW : dynamic time warping
# 1:1 대응 관계로 비교하면 차이가 많이 발생
# 그라프 비교 (센서신호) : 시차 지연이 발생
# 음악에서 프로젝트를 할때 : 파형분석 - 같은 유형의 음악 장르를 구별
#install.packages("dtwclust") 
library(dtwclust)
data(uciCT)
str(CharTraj)
# interpolate : 보간법 (중간에 데이터가 없는 경우)
# 데이터 사이즈가 일치 ( NA )
series <- reinterpolate(CharTraj, new.length = max(lengths(CharTraj)))
(series<- zscore(series)) # z-정규화 NaN -> 0
# time series
# 파형인 경우는 NA를 0으로 한다다
# 거리값 : 정규화 ( 변수별로 같은 영향력을 갖기위해) : 정규화를 안하면 가중치 부여효과
pc.dtwlb <- tsclust(series, k= 20L,
                    distance = "dtw_lb", centroid = "pam", # L1 절대값 , L2 차의 제곱
                    seed = 3247, trace = TRUE,
                    control = partitional_control(pam.precompute = FALSE),
                    args = tsclust_args(dist = list(window.size = 20L)))
plot(pc.dtwlb)

# kmeans의 단점
# k를 결정,  center를 결정
# 이상치가 있는 경우 : k median model ( kmeans를 대신해서 )
# eps : epsilon, 최소 data points(minpts) => DBSCAN
# 그룹이 되려면 최소한 MinPts개수만큼의 요소가 있어야함
# R 에서는 패키지 버젼 -> python하위 패키지 문제가 발생하는 경우
pc.dtwlb <- tsclust(series, k= 20L,
                    distance = "dtw_lb", centroid = "pam", # L1 절대값 , L2 차의 제곱
                    seed = 3247, trace = TRUE,
                    control = partitional_control(pam.precompute = FALSE),
                    args = tsclust_args(dist = list(window.size = 20L)))
plot(pc.dtwlb)
#install.packages("dbscan")
library(dbscan)
iris2 = iris[-5]
ds = dbscan(iris2, eps = 0.42, minPts=5)
# plot(ds,iris2[c(1,4)]) 

set.seed(2)
n <- 400
x <- cbind(
  x = runif(4,0,1) + rnorm(n, sd= 0.1),
  y = runif(4,0,1) + rnorm(n, sd= 0.1)
)
plot(x, col = rep(1:4, time =100))
# DBSCAN clustering : 자동으로 k가 결정됨됨
# ordering Points to Identify the Clustering Structure
res <- optics(x, eps =10, minPts = 10)
res
res <- extractDBSCAN(res, eps_cl = .065) # threshold 문지방, 경계선
# convexhull
hullplot(x,res) #noise를 구별 할 수 있음
plot(res) # 검정색이 noise에 속함

# kmeans와 dbscan을 비교해서 출제

# knn (k nearest neighbor) : k 개의 근접한 이웃의 추천에 따라 결정
# knn: 학습 여부 학습이 안됨 : 지도학습
# 이유 : 거리값을 구해야 하기때문에 거리값은 : 정규화 
# k는 홀수
# instance based  model 
# caret패키지를 사용하면 모델을 생성함

# k means는 비지도학습
                    # grape,fish,carrot, orange,celery, cheese 
train_df = data.frame(x1=c(8,2,7,7,3,1), #단맛
                      x2=c(5,3,10,3,8,1),#아삭거림
                      y=factor(c(1,2,3,1,3,2))) #과일(1), 단백질(2), 채소(3)

train_df
plot(train_df$x1, train_df$x2, col=train_df$y, xlab='단맛', ylab='아삭거림')
# 새로운 항목:     토마토,   땅콩 , 사과
test_df = data.frame(x1=c(6,3,10), x2=c(4,8,9))
test_df
# 토마토 - grape
sqrt((8-6)^2 + (5-4)^2)
sqrt((2-6)^2 + (3-4)^2)
library(class)
knn(train_df[,-3],test_df, train_df$y, k=3) #train 데이터, test가 동시에 입력됨
# 표준오차 = 표준편차 / sqrt(n)
sqrt(length(train_df$x1)) #sqrt(n) # k값을 구하는 방법

# 문제 : iris 데이터에 대해 knn모델을 구현해 보시오
# 데이터는 7:3으로 분할
# accuracy까지 출력하시오
#install.packages("rattle")
library(rpart)
library(rpart.plot)
library(rattle)
library(class)
 
# 데이터 분할
set.seed(123) # 재현성을 위해 seed 설정
iris$Species <- factor(iris$Species, levels = unique(iris$Species))
result <- sample(1 : nrow(iris), nrow(iris)*0.7)
train <- iris[result,]
test <- iris[-result,] 

# kNN 예측
k <- sqrt(nrow(train)) # k값 계산
knn_pred <- knn(train[,-5], test[,-5], train$Species, k=round(k))

# 정확도 계산 0.9555556
accuracy <- sum(knn_pred == test$Species) / nrow(test)
print(accuracy)

# rpart 모델 훈련 
model <- rpart(Species~., data = train)

# rpart 모델로 예측
pred_probs <- predict(model, test, type="prob")
pred <- factor(colnames(pred_probs)[apply(pred_probs, 1, which.max)], levels = levels(test$Species))

# confusion matrix 계산 Accuracy : 0.9333    
library(caret)
confusionMatrix(pred, test$Species)

## 교수님의 정답 
data(iris)
set.seed(415)
## 시험때는 정규화를 해야함
idx = sample(1: nrow(iris), nrow(iris)*0.7)
(training = iris[idx, ])
(testing = iris[-idx, ])
names(training)
#k개수
sqrt(length(training$Sepal.Length))
model.knn = knn(training[,-5],testing[,-5], training$Species ,  k=11, prob = T)
model.knn
summary(model.knn)
#평가
tb<- table(model.knn, testing$Species)
sum(diag(tb))/sum(tb)


#caret 패키지는 자동화 패키지
library(caret) 
modelLookup(model = "knn")
data(iris)
TrainData <- iris[,1:4]
TrainClasses <- iris[,5]
featurePlot(TrainData, TrainClasses, plot = "density", auto.key = list(columns=3))
knnFit1 <- train(TrainData, TrainClasses,
                 method = "knn", # 신경망 , tree , 확률, 유사도도
                 preProcess=c("center", "scale"), # 전처리 
                 tuneLength = 20,
                 trControl = trainControl(method = "cv")) # cross validation
                 # 전체 데이터를 일정한 덩어리로 분할을 하고 돌아가면서 test가 되는것
plot(knnFit1)
# knn은 instance based model
knnPredict <- predict(knnFit1, newdata = TrainData)
confusionMatrix(knnPredict, TrainClasses)
#  Accuracy : 0.96           

# 목요일 , 금요일 2일 pt 15장이상 
# 프로젝트 : 가설설정  왜? 80~90퍼 (논문, 통계기사로 증명)
# 데이터 전처리
# 데이터 요약 / 시각화
# 모델 : 모델
# 실패사례와 극복사례 (3 가지씩)
#1 . 10월 30일 주제를 같이 정하긴 했으나 부족한 부분이 있다고 판단
#    원래 정햇던 주제와 다른 주제로 변경하려고 했으나 의견이 일치하지 못함    
#    서로 생각이 달라서 논쟁이 좀 있었으나 각자의 배려심으로 중간 협의점을 찾음
#    원래 정햇던 주제가 조금 발표하는 제 입장에서 재미요소가 많이 떨어져서
#    좀더 재미쪽으로 제 흥미 위주를 생각해서 말을 했으나 조별 과제인 만큼
#    조의 의견을 좀더 수렴해서 좀 더 진중한 내용으로 하기로 결정했습니다.
#    optimal capacity와 같은 협의점을 찾아서 적용했습니다
#    
# 모델의 개선방향
