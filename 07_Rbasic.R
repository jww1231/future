data1= 1:5 
data2= 2:6
#(1 -3)  *  (2 -4)
#2 -3    3 -4
#3 -3    4 -4
#4 -3    5 -4
#5 -3    6 -4


sum((data1-mean(data1))*(data2-mean(data2))) / (length(1:5)-1)
cov(1:5 , 2:6)
cov(1:5, c(3,3,3,3,3)) #0
cov(1:5, 5:1) # 역상관 #공분산은 절대적 크기의 정도를 알수없음

(m<-matrix(c(1:10, (1:10)^2), ncol=2))
cor(m, method = "pearson")
cor(m, method = "spearman") # 수치가 순위의 의미가 있는것
cor(m, method = "kendall")  # 부합쌍과 비부합쌍의 비율을 이용해서 상관계수를 정의

# 어제  :  var.test 등분산 테스트
# cor.test : 상관계수를 검정 : 귀무가설 : 서로 독립적이다( 상관이 없다. )
# 대립가설 : 서로 상관이 있다.
# p-value는 우측부터의 신뢰구간값임
# 적률 : 1차 적률 -  평균, 2차 적률 분산, 3차적률 = 왜도, 4차 = 첨도 
cor.test(c(1,2,3,4,5),c(1,2,3,4,5), method = "pearson") # p-value < 2.2e-16  0.05 보다 작음 : 상관이 있다

x <- c(44.4, 45.9, 41.9, 53.3, 44.7, 44.1, 50.7, 45.2, 60.1)
y <- c( 2.6,  3.1,  2.5,  5.0,  3.6,  4.0,  5.2,  2.8,  3.8)
cor.test(x,y, method= "kendall", alternative = "greater") # p-value = 0.05972 귀무가설 기각하지못함 상관이없다
# 단측검정 ( 큰경우,  작은경우)
# 양측검정 0.05 / 2  : 정규분포는 대칭 양쪽에서 검증하는것

d<- data.frame(x1=rnorm(10),
               x2=rnorm(10),
               x3=rnorm(10))

head(d)
(M<- cor(d))
#install.packages("corrplot")
library(corrplot)
corrplot(M, method = "shade") # corrplot은 시각화 함수
corrplot(M, method = "pie") 
corrplot(M, method = "ellipse") 
?corrplot
# 순서를 변경해도 됨  x1과 x2의 상관이나
# x2와 x1의 상관이 의미가 같다

a <- c(4.0, 4.2, 3.9, 4.3, 4.1 )
b <- c(2.0, 2.1, 2.0, 2.1, 2.2 )
c <- c(0.60, 0.59, 0.58, 0.62, 0.63)

(ab <- sum(a+b)/length(a))
(mat <- matrix(c(a,b,c), nrow=5, byrow = F))
(avr<- colMeans(mat))
(acha <-a - avr[1])
(bcha <-b - avr[2])
(ccha <-c - avr[3])
#    a      b      c
#  a
#  b
#  c
(aa_var<- sum(acha * acha) / (length(a)-1)) #0.025
(ab_var<- sum(acha*bcha)/ (length(a)-1))# 0.0075
(ac_var<- sum(acha*ccha)/ (length(a)-1))# 0.00175
cov(mat)

# 상관계수
(aa_var / (sd(a)*sd(a))) #1
(ab_var / (sd(a)*sd(b))) #0.5669467
(ac_var / (sd(a)*sd(c))) #0.533745
cor(mat)

#고유값 분해
(eigvector<-eigen(cor(mat)))
eigvector # $values 고유치:정렬 - 분산의 크기
# $vectors 고유벡터 - 내적이 0이면 정직교
eigvector$vectors[,1]%*%eigvector$vectors[,2]
eigvector$vectors[,1]%*%eigvector$vectors[,3]
eigvector$vectors[,2]%*%eigvector$vectors[,3]
# 정규직교행렬
eigvector$vectors[,1]^2
#정규직교행렬: 피타고라스로 빗변길이가 1이나왔다는 뜻은 축을 방향값으로 표현함함
sqrt(sum(eigvector$vectors[,1]^2)) #피타고라스
sqrt(sum(eigvector$vectors[,2]^2)) #피타고라스
sqrt(sum(eigvector$vectors[,3]^2))
# MRS (move,rotate, scale)
# 0이 0이 아닌5.551115e-17 라서  오차가 발생 축이 틀어짐

#회귀분석 ( linear regression )
# 데이터로 부터
# 방정식의 계수를 구하는것
# y값을 예측하기 위해서
# y=ax +by + cz + b
y<- c(1,2,3,8,5,3,10,7)
x1<- c(2,4,5,6,8,10,11,13)
x2<- c(1,2,2,4,4,4,6,6)

opar= par(mfrow=c(1,3))
plot(x1,y)
plot(x2, y)
plot(x1, x2)
summary(lm(y~x1)) #lm = linear model : formula
# 잔차(residual) : 실제값(y) - 예측값(yhat)의 차이가 잔차다
# y = ax
# Coefficients 계수
#Intercept 절편
#직선의 방정식 y = ax + b
# 회귀 방정식0.7121 + 0.5645 * x1
# t-value 는 t 분포에서 나오면 t벨류 정규분포는 p벨류
# 잔차의 표준 오차 : 2.551
# R-squared : 0.449, 결정계수 :  모델 설명력
# 수정된 결정계수 Adjusted R-squared:  0.3571 
# 결정계수가 변수의 숫자가 많아지면 저절로 커지는 성향이 있다
# 변수가 많아져도 변하지 않도록 변수의 갯수를 고려한것이 수정된 결정계수임
# p-value: 0.06904 귀무가설을 기각할 수 없다 : 모델이 유의미하지 않다.
summary(lm(y~x2))
y<- -0.5340 + 1.4921* x2 
#F-statistic:    18 on 1 and 6 DF,  p-value: 0.005423 p벨류가 0.05보다 작음 유의미함
# 결정계수 = 회귀제곱합 / 전체제곱합( 회귀제곱합 + 잔차제곱합)

summary(lm(y~x1+x2))
-0.1041 +  -1.1566 *x1 +  3.7267*x2 #[1] 1.3094 2.7229 1.5663 7.8631 5.5499 3.2367 9.5335 7.2203

# 결정계수 : R-squared: 0.9532 모델 설명력이 좋아졌음
# 계수도 유의미하다
# 모델이 유의미하다
# accuracy를 높이려면 변수를 추가해야한다.

#문제 
#str(women) #$height:,$weight
#1)회귀분석을 실행하시오
str(women)
cov(women)
cor(women)
plot(women$height,women$weight)
su<-summary(lm(women$height~women$weight)) 
su
#2)회귀 방정식을 작성하시오
25.723456 +  0.287249 * women$weight

#3)각데이터에 대해 예측하고 잔차를 구해보시오
# 잔차 계산
residuals <- resid(su)
residuals
 
fit= lm(women$weight~women$height)
summary(fit)
# p-value: 1.091e-14 모델이 유의미하다
# 모형의 설명력은 Adjusted R-squared:  0.9903  99%
# 데이터에 적용된 선형회귀가 적절한가 : 상관분석0.9954948 적절함
 cor(women$height,women$weight)
# accuracy : 연속된 수치의 정확도는 : 상관분석

 residuals <- resid(fit)
#Residuals:
#   Min      1Q  Median      3Q     Max 
# -1.7333 -1.1333 -0.3833  0.7417  3.1167 

min(residuals)
quantile(residuals,0.25)
median(residuals) 
quantile(residuals,0.75)
max(residuals)

plot(weight~height, data= women)
abline(fit, col="blue")

#cars 데이터를 선형회귀 해보시오
# 모델이 통계적으로 유의미한가
# 계수가 유의미 한가
# 모델의 설명력은?
# 선형회귀는 정당한가?
# accuracy는?

str(cars)
summary(cars)
plot(cars$dist , cars$speed)


# 모델이 통계적으로 유의미한가? p-value 유의미함
fitt= lm(cars$dist~cars$speed)
summary(fitt)
abline(fitt)
#->p-value: 1.49e-12로 귀무가설 기각 대립가설 채택 -> 모델은 통계적으로 유의미함

# 계수가 유의미 한가? 유의미하다
cor(cars$speed,cars$dist) 
#상관분석 0.8068949적절함

# 모델의 설명력은?
#R-squared:  0.6438 64%  유의미 한것 

# 선형회귀는 정당한가?
cor(cars$speed,cars$dist) 
#상관분석 0.8068949  80% 적절함
names(fitt)
(cof=coef(fitt))
(cof["speed"])
(dist_pred = cof["(Intercept)"] + cof["speed"] * cars$speed)
fitted(fitt) # 계산된 fitting값이 출력됨
residuals(fitt)[1:4]
sum(fitted(fitt)-cars$dist) # 잔차값

plot(fitt)
par(mfrow = c(1,1))


# qqnorm 정규분포

# accuracy는?
residuals <- resid(fitt)
min(residuals)
quantile(residuals,0.25)
median(residuals) 
quantile(residuals,0.75)
max(residuals)

plot(speed~dist, data= cars)
abline(fitt, col="blue")


names(fitt)
(cof=coef(fitt))
(cof["speed"])
(dist_pred = cof["(Intercept)"] + cof["speed"] * cars$speed)
fitted(fitt) # 계산된 fitting값이 출력됨
residuals(fitt)[1:4]

sum(fitted(fitt)-cars$dist) # 잔차값

plot(fitt)
par(mfrow = c(1,1))
#qqnorm은 표준화 잔차가 정규분포이다


# 프로젝트 ( 제목선정은 관여하지 않음 )
# 대전 재비산 먼지 데이터 분석 및 도로 청소차 구간 선정
# 성과 지표 상관관계 분석
# 해외 직접 투자가 국내 시장에 미치는 영향
# 날씨에 따른  따릉이 사용량과의 관계
# 가설검정, 회귀분석, 트리분석


#bptest :  등분산성 테스트
# 회귀분석의 가정 : 등분산성 , 독립성, 정규성, 선형성
# 귀무가설 : 등분산성이다.
# 대립가설 : 이분산성이다.

library(lmtest)
bptest(cars$speed ~ cars$dist) # 등분산성이다
#Durbin - watson
dwtest(fitt) # 독립성 검증
# 2이면 자기상관성이 없다 (하나의 변수가 주기별로 다른 데이터 영향을 줌)
# 0 ~ 2 양의 자기상관성이 있다. (0 이면 아주 높은 양의 자기상관성이 있다)
# 시계열 분석의 대상
# 2 ~ 5 음의 자기상관성이 있다.
# 귀무가설 : 독립적이다.
# 대립가설 : 독립적이지 않다.

prediction_result<-predict(fitt, newdata=data.frame(speed = 10 )) #속도가 10일 경우 제동거리 예측
point_estimate <- prediction_result[1]
point_estimate
# 21.7 # 점추정
predict(fitt, newdata=data.frame(speed = 10 ), interval = "prediction")
# 실제상황과 같이 예측( 예외상황도 고려해서)
predict(fitt, newdata = data.frame(speed=c(4.0,25.0, .21)),interval = "confidence")
#interval = "confidence" 구간추정



library(MASS)
data("Boston")
help("Boston")
str(Boston)
?Boston
# 정규화
boston_df<- as.data.frame(scale(Boston))
# 506 obs. of  14 variables: (독립변수 13, 종속 1개)
# 두개로 분할 : 학습데이터와 평가 데이터로 분리

(idx <- sample(1:nrow(boston_df), 300))
trainDF <- boston_df[idx,]
testDF <- boston_df[-idx,] # 제외하고
dim(trainDF); dim(testDF) #300  14 # 206  14

formula <- medv~ crim+zn+indus+nox+rm+age+dis+rad+tax+ptratio+black+lstat # ex) 부동산 집값 변화 모델 만들수 있음
lm_model <- lm(formula = formula, data = trainDF)
summary(lm_model)

# 과적합이 벌어짐 -> 일반화가 되지않음
pred<- predict(lm_model, testDF) # 테스트 데이터는 학습에 참여하지 않음
pred
cor(pred, testDF$medv) # 숫자일때의 정확도는 상관계수


# 귀무가설 : 자기상관성이 없다
# 대립가설 : 자기상관성이 있다
dwtest(lm_model) # DW = 2.2155 : 2면 자기상관성이 없다

library(car)
#vif(lm_model) 1~ 10 미만이면 다중공선성이 없다고 본다
sqrt(vif(lm_model)) >2 # 다중공선성이 있다  # 이게 조금더 엄격하게 본다



