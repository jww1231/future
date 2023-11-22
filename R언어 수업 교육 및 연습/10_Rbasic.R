library(lsa)
vec1 = c(1,1,1,0,0,0,0,0,0,0,0,0)
vec2 = c(0,0,1,1,1,1,1,0,1,0,0,0)
cosine(vec1,vec2)
 
#문제 : 내적을 이용해서 cosine 유사도를 구해보시오

#install.packages("proxy")
library(proxy)

cosine1<- dist(matrix(vec1), matrix(vec2), method="cosine")

cosine2 <- 1-cosine1
cosine2

##### 정답
(vec1 %*% vec2) / (sqrt(sum(vec1^2))*sqrt(sum(vec2^2))) ## () 괄호를 잘 적지 않으면 오류발생함
(vec1 %*% vec2) / (norm(vec1, type="2")* norm(vec2, type="2"))

# recommenderlab
#install.packages("recommenderlab")
library(recommenderlab)
m<- matrix(sample(c(NA,0:5),100, replace =T, prob = c(.7,rep(.3/6,6))),
           nrow =10, ncol=10, dimnames= list(
             user=paste('u', 1:10, sep = ''),# 행
             item=paste('i', 1:10, sep = '') # 열열
           ))
m

# 행렬표현방법 : 인접행렬 / 그라프로 표현 (행, 열, 데이터)
class(m)
typeof(m) # integer vector로 구성된 matrix
# 추천: 평점행렬 -> 희소행렬 -> 그라프로 저장됨
r<- as(m, "realRatingMatrix")
r
class(r)
typeof(r) #R은 모두 class로 만들어짐 => 구조적 프로그래밍화
dim(r)
rowCounts(r)
colCounts(r)
rowMeans(r)
getRatings(r) # 평점만 가져옴
getRatingMatrix(r)
image(r)
nratings(r)
show(r)
hist(getRatings(r))
as(r, "list")
as(r, "matrix")
# 그라프 방식으로 저장됨
head(as(r,"data.frame")) # 원래 저장하는 모습

#추천알고리즘
# UBCF (USER BASED collaboratory filter ) : 행
# IBCF (Item BASED collaboratory filter ) : 열 jaccard 유사도를 많이 사용함
# 척도 
# cosine similarity 코사인 유사도
# pearson similarity 피어슨 유사도
# jaccard similarity 자카드 유사도 (binaryRatingMatrix)
# 추천 데이터는 희소행렬
# 특징을 뽑는 SVD (eigen) 비정방행렬의 형태
# 정방행렬이 되려면 상품개수 == 사용자 개수가 같아야함
# Matrix Factorizing (MF) : 특징을 추출해서 유사도를 계산한다
# 추천기계 : Recommender / HybridRecommender
# 


data("MovieLense") # 영화 평점 데이터이며 영화추천 진행행
typeof(MovieLense)
class(MovieLense) #realRatingMatrix로 이미 변환이 된 데이터
# 358 x 1664
# 영화를 100개 이상 본사람들
(MovieLense100 <- MovieLense[rowCounts(MovieLense) >  100,])
# 50 x 1664 
(train <- MovieLense100[1:50])

rec <- Recommender(train, method = "POPULAR") #모델학습(개수)
rec #모델 
# 291, 292번이 있음
pre <- predict(rec, MovieLense100[101:102],n=10) # 10개 추천
pre #‘topNList’ with n = 10 for 2 users. 
as(pre,"list") # id와 영화 제목 출력됨
as(pre,"matrix") # 
pre

(MovieLense100 <- MovieLense[rowCounts(MovieLense)>100,])
train <- MovieLense100[1:100]
test <- MovieLense100[101:103]

recom <- HybridRecommender( ## 하이브리드 추천
  Recommender(train, method = "POPULAR"),
  Recommender(train, method = "RANDOM"),
  Recommender(train, method = "RERECOMMEND"),
  weights = c(.6, .1, .3)
)
recom
getModel(recom)
as(predict(recom, test), "list") # 0번부터 시작

# 영화 추천 시스템 (상관계수 추천) 
# a에 대해서 movie4, movie5번 중에서 어떤것을 추천할건지?
# 상관계수는 열중심 : 유사한 사람
# 
movie <- read.csv(file.choose(),header = T)
movie
str(movie)
movie_t <- t(movie[,-c(1,5,6)]) # 사람에 대한 상관계수가 필요해서 전치를 진행함( 대상을 열로 표현 )
movie_t
colnames(movie_t) <-c("a","b","c","d","e")
cor(movie_t) # a에게 movie5번을 추천

# 유클리디안 거리를 이용한 추천
recomm_w <- read.csv('./sf_recomm.csv')
dim(recomm_w) #2091   13
head(recomm_w)
recomm_df <- recomm_w[c(1:8)]
head(recomm_df)
#코드, 투자금액,   나이, 집마련월적립금, 결혼자금월 적립금, 교육자금, 은퇴자금, 기타목돈
# CODE INVEST_TOT NOWAGE REQ_H REQ_M REQ_EDU REQ_R REQ_ETC   FO_H FO_M FO_EDU  FO_R    FO_ETC
# 과제  : 나와 가장 비슷한 패턴(나이, 적립금, 교육자금, 은퇴자금, 기타목돈)을 보이는 사람의 연금 상품으로 추천
# 추천데이터
inputdata <- c(0,208,55,60,35,0,25,183)
# Dataframe 생성
recomm_df2 <- rbind(inputdata, recomm_df)
# code 컬럼 제외
(recomm_data <- recomm_df2[2:8])
# 거리값 계산
test_dist <- dist(head(recomm_data), method = "euclidean")

test_dist
class(test_dist) # 특별한 행렬 : 결과 dist
(test_dist_mt <- as.matrix(test_dist)) # 거리행렬 -> 행렬로 변환
(test_dist_mt_sort <- sort(test_dist_mt[,1]))
(result_index <- names(test_dist_mt_sort[2])) # 5번
real_indext <- as.numeric(result_index) # 5번을 숫자인덱스
recomm_df2[real_indext,1]
recomm_w[real_indext, 9:13] 
# 구성비를 추천 FO_H      FO_M        FO_EDU       FO_R      FO_ETC
#                0      0.1627907   0.5710075   0.01620176      0
# 모델은 유사도에 의해 추천 : 거리에 의한 추천 MF , SVD
# 문제 :  
real_data <- c(0,250,45,10,30,10,0,10)
#을 가진 사람의 어떤 구성비를 추천할 것인지를 결정하시오 (거리값 기준)
recomm_df3 <- rbind(real_data, recomm_df)
# code 컬럼 제외
(recomm_data2 <- recomm_df3[2:8])

test_dist2 <- dist(head(recomm_data2), method = "euclidean")

test_dist2
(test_dist_mt2 <- as.matrix(test_dist2))
(test_dist_mt_sort2 <- sort(test_dist_mt2[,1]))
(result_index2 <- names(test_dist_mt_sort2[2])) # 5번
(real_indext2 <- as.numeric(result_index2)) # 5번을 숫자인덱스

recomm_df3[real_indext2,1]

# 추천 구성비 출력
recomm_w[real_indext2, 9:13] # 유사한 번호 2번
#    FO_H    FO_M        FO_EDU       FO_R      FO_ETC
#     2   0.5087719   0 0.5856075   -0.245614      0
ncol(recomm_df3)
 

# movie 데이터를  realRatingMtrix로 변환 하고 모델적용
movie
library(recommenderlab)

library(reshape2)
movie_long <- melt(id=1, movie) # id를 1번열을 중심하고
movie_long # wide , long
names(movie_long) <- c('user', 'movie', 'rating')
movie_long
# rating이 0인 것들은 제외 (행선택)
# 0이 아닌것들만 선택
movie_long <- subset(movie_long, rating !=0)
length(movie_long$rating)
movie_real <- as(movie_long, "realRatingMatrix")
dim(movie_real)
as(movie_real, "matrix") #확인
#학습데이터 생성
trainSet <- movie_real[c(2:5),]
recommTarget <- movie_real[1,]
# 추천모델 구성 : 유저기반 추천, 유사도 척도 :  피어슨 상관계수
recom_model<- Recommender(trainSet, method = "UBCF", parameter= "Pearson")
recomm_list <- predict(recom_model, recommTarget, n=3)
(recom_result <- as(recomm_list, "list"))
as(recomm_list, 'matrix')

# 음식 추천 시스템
# 3가지 이상 음식을 주문한 사람만 학습자로 하고 학습에 참여하지 못한
# 사람에 대해 음식을 추천하시오
gloseri <- read.csv(file.choose(),header = T, encoding = "utf-8", fileEncoding = "cp949")
head(gloseri)
str(gloseri) # 주문내용 
realData <- as(gloseri,'realRatingMatrix')
as(realData, 'matrix') #1~7 : 7명
rowCounts(realData) # 사람별 카운트
colCounts(realData) # 제품별 카운트
rowMeans(realData)  
getRatings(realData)
getRatingMatrix(realData)
image(realData)
nratings(realData)
sample(realData)
show(realData)

# 훈련데이터 생성 #UBCF기반 행기반
trainData <- sample(1:7, 6) # 6명을 선택하는것
(trainSet<- realData[trainData])
as(trainSet,'matrix') # 6명이고 x 5제품
trainSet2 <- trainSet[rowCounts(trainSet) >= 3 ] #이게 주문 3개한사람 골라내는것
as(trainSet2, 'matrix') # 5명 ( 1명이 학습에서 제외됨 )
recomm_model_gl <- Recommender(trainSet2, method="UBCF", # 사용자 기반 추천 모델
                               parameter='Cosine') # 척도는 cosine 유사도 
recomm_model_gl
recomm_target_gl<-realData[-trainData] # 1인 
recommandList<-predict(recomm_model_gl,recomm_target_gl,n=2) # 음식을 두개 추천하도록 하는 코딩
(recomm_result<-as(recommandList,'list')) # "식빵" "치킨" : NA인 데이터가 있어야 추천이 가능함


# 다음주 월요일 발표 후 파이썬을 배움
# IBCF기반 추천 : 열기반 : TRUE /FALSE  binarize 이진화 를 이용해서 데이터를 변환
as(realData, 'matrix')
(realData_b <- binarize(realData, minRating = 1)) # 1이상은 참이다
as(realData_b, 'matrix') 
trainData <- sample(1:7,6)
(trainSet <- realData_b[trainData]) # 데이터 추출
as(trainSet, 'matrix')
recomm_target_gl <- realData_b[-trainData] # 예측할 데이터
recomm_model_gl <- Recommender(trainSet, method = "IBCF",# item based
                               parameter = "Jaccard") #공통(교집합) / 전체
recommandList<- predict(recomm_model_gl, recomm_target_gl, n=2)
(recomm_result <- as(recommandList, 'list'))

# 문제 
# MovieLense 데이터에 대해
# 아이템별 영화 평가 점수 데이터 셋으로 추천모델을 생성하시오
# 조건 1) 아이템별 영화 평가 점수 데이터 셋은 binary포멧으로 생성
# 조건 2) 영화를 50회 이상 보고 영화별 100 회 이상 본 사용자가 있는 경우를 대상으로 하시오
# 조건 3) 사용자는 90% 훈련참여 하고 10% 추천으로 데이터를 분할
# 조건 4) 10% 데이터에 대해 영화 5개씩을 추천하시오



data("MovieLense") 
typeof(MovieLense)
class(MovieLense) 
# 아이템별 영화 평가 점수 데이터 셋으로 추천모델을 생성하시오
model <- Recommender(MovieLense, method="IBCF")

# 아이템별 영화 평가 점수 데이터 셋은 binary포멧으로 생성
#데이터를 바이너리 형식으로 변환:
binaryMovieLense <- binarize(MovieLense, minRating=1)
binarymodel <- Recommender(binaryMovieLense, method="IBCF")

# 영화를 50회 이상 보고 영화별 100 회 이상 본 사용자가 있는 경우를 대상으로 하시오
(MovieLense50 <- MovieLense[rowCounts(MovieLense) >  50,])# 영화를 50개 이상 본사람들
(MovieLense100 <- MovieLense[rowCounts(MovieLense) >  100,])# 영화를 100개 이상 본사람들

# 사용자는 90% 훈련참여 하고 10% 추천으로 데이터를 분할
 
as(binaryMovieLense, 'matrix') 
users <- nrow(binaryMovieLense)
training <- (sample(1:users, size = 0.9 * users))
trainData <- binaryMovieLense[training]
testData <- binaryMovieLense[-training]

selected_movies50 <- which(colCounts(MovieLense) >= 50)
MovieLense100Movies <- MovieLense[, selected_movies]

selected_movies100 <- which(colCounts(MovieLense) >= 100)
MovieLense100Movies <- MovieLense[, selected_movies]

binary_model_train <- Recommender(trainData, method="IBCF")

(recommendations <- predict(binary_model_train, testData, n=5))

as(recommendations, "list")
nrow(testData)
nrow(MovieLense100Movies)

######################선생님 정답
data(MovieLense)
MovieLense # 943 x 1664 
# 추천 행렬 : 희소행렬 
ratings_movies = MovieLense[ rowCounts(MovieLense) >= 50,  #영화를 50번 이상
                             colCounts(MovieLense) >= 100] #한 영화를 100번이상

ratings_movies # 565 x 336  #학습대상이 좁혀짐
(m<- as(ratings_movies, 'matrix'))
sum(table(m[1,]))
sum(table(m[,1]))
ratings_movies_b <- binarize(ratings_movies, minRating=1)
as(ratings_movies_b,'matrix')
#데이터 분할 
idx <- sample(1:nrow(ratings_movies), nrow(ratings_movies)*0.9)
trainSet <- ratings_movies_b[idx,]
recomm_target <- ratings_movies_b[-idx,]
dim(trainSet)
dim(recomm_target)
recomm_model <- Recommender(trainSet, method = "IBCF", parameter = "Jaccard")
recomm_list <- predict(recomm_model, recomm_target, n=5)
recomm_list
head(as(recomm_list,"list"))

#PCA (principal component analysis) 주성분 분석
a <- c(4.0, 4.2, 3.9, 4.3, 4.1 )
b <- c(2.0, 2.1, 2.0, 2.1, 2.2 )
c <- c(0.60, 0.59, 0.58, 0.62, 0.63)
(mat <- matrix(c(a,b,c ), nrow=5,byrow=F )) # 5x3
# 공분산행렬, 상관계수행렬 
cov(mat)
eigvetor<-eigen(cor(mat))
names(eigvetor) # "values" 고유치 "vectors" 직교벡터
eigvetor$values #  2.2592714 0.5202666 0.2204620
eigvetor$vectors 
eigvetor$vectors[,1] %*% eigvetor$vectors[,2]
eigvetor$vectors[,2] %*% eigvetor$vectors[,3]
eigvetor$vectors[1,] %*% eigvetor$vectors[2,] # 6.938894e-18 0이나 마찬가지인 값
# 정방행렬이면서 대칭행렬에 대한 역행렬은 전치행렬이다 아래가 증명 함 맞다 
teigvector = t(eigvetor$vectors)         #  [,1]         [,2]         [,3]
eigvetor$vectors %*% teigvector     #[1,] 1.000000e+00 6.938894e-18 1.387779e-16
                                    #[2,] 6.938894e-18 1.000000e+00 0.000000e+00
                                    #[3,] 1.387779e-16 0.000000e+00 1.000000e+00

#주성분 분석 # 고유값분해
str(mtcars) # 32 x 11
head(mtcars,10)
# true : 상관계수행렬, false : 공분산행렬
fit <- princomp(mtcars, cor=T) # 주성분 분석 : 상관계수를 이용해서 
summary(fit) #Cumulative Proportion 누적% 85% or 95%
#Comp.1    Comp.2     Comp.3     Comp.4     Comp는 임의의 이름 
# 요인 분석, 주성분 분석, kmeans 명명식 : 새롭게 이름을 명명한다
# 주성분 분석의 각 축을 결정할때는 데이터의 모든 열 요소가 참여해서 새로운 축을 만드는것
# domain knowledge를 알고 있으면 가능함
# 축을 재명명하는것은 참여한 변수들의 구성비를 보고 축을 재 명명한다
# 분산이 크면 종속변수를 설명하는데 크게 기여한다
plot(fit, type="lines")
fit$scores
fit$scores[, 1:3] # 1축에서부터 3축까지 영향을 미치는 변수의 값에 대해서 출력
fit$scores[, 1:4]
biplot(fit) # 오른쪽 mpg 왼쪽 cyl와 disp의 관계  comp1은 배기량과 연비 comp2는 carb, gear 와  qsec의 관계

#주성분 분석의 결과로 선형회귀
data <- fit$scores[,1:4] # 원래 데이터 %*% rotate( 고유벡터 ) 원래 데이터에 고유벡터를 곱한게 결과값 scores 가 된다
class(data)
(data <-cbind(mtcars$mpg, data))
colnames(data) <- c("mpg", "PC1", "PC2", "PC3", "PC4")
head(data)
data <- as.data.frame(data)

regression_model <- lm(mpg ~ ., data= data)
summary(regression_model) #Adjusted R-squared : 0.8867 주성분 분석한 값

regression_model2 <- lm(mpg ~ ., data= mtcars)
summary(regression_model2) #Adjusted R-squared : 0.8066 원래데이터 분석한 값값

(x<-1:10)
(y<- x+ runif(10,min= -.5, max=.5))
(z<- x+y+runif(10,min=-10,max=10))
data<- data.frame(x,y,z)
(pr <- prcomp(data,scale=T)) # 주성분 분석 (구현방법만 다름)
# 고유벡터 : 새로운 축 (데이터로부터 생성된)
# 정직교하는 축: 다중공선성
# 다중 공선성 : 두 독립 변수간에 상관관계가 있는경우
# 다중공선성이 있으면 종속변수에 더블의 영향을 미침
# 정직교축에 데이터를 재표현하면 다중공선성이 사라짐 (noise가 사라진다.)
# original data :  10x3
# 10x3 * 3x3 -> 10x3 -> 분석 대상 -> 다중공선성이 없는 분석이 가능하다
# 뒤에있는 열수만큼 특성을 추출한다 
# 독립변수를 변환하더라도 종속변수는 변함이 없다

summary(pr)
screeplot( pr,type = c("barplot", "lines"), max(10, length(pr)))
names(pr)
pr$sdev
pr$rotation
pr$center
pr$scale
pr$x
biplot(pr)

