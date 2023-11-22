score4 <- c(3,3,6,7,7,10,10,10,11,13,30)
(n<-length(x))
min(score4)
max(score4)
range(score4)
diff(range(score4))
mean(score4) # 평균
median(score4) # 중위수
var(score4) # 분산 : 평균의 질적판단, 분산이 크면 중요변수 (PCA 주성분분석 기준)
sd(score4) #표준편차 : 질적상태 판단을 양호하게 하는것, 정규분포의 기준값
           #표준편차 1배수 : 68% 1배수 95% 2배수 99.7% 3배수
           #표준오차 : 신뢰구간 설정을 위해서 
           #변동계수 : 이질적 집단 비교
           #정규분포 : 모집단은 정규분포를 가정

#install.packages("moments")
library(moments)
set.seed(1234) #  컴퓨터의 난수는 의사난수 시드값을 줘야함 
# 의사난수는 가짜 난수다
n.sample <- rnorm(n =10000, mean = 55, sd = 4.5) # sampling
skewness(n.sample) #왜도 : 기준값은  0 좌우가 대칭
kurtosis(n.sample) #첨도 : 기준값이 3이다
# 3.009444
# 1차 원점에 대한 적률은 평균이고
# 2차 원점에 대한 적률은 분산이고
# 3차 원점에 대한 적률은 왜도이고
# 4차 원점에 대한 적률은 첨도이다.

# 정규분포가 아닌 데이터는 정규분포로 변환해야한다
# log, sqrt => 정규분포로 변화
#install.packages("UsingR")
library(UsingR)
data(cfb)
head(cfb)
summary(cfb$INCOME)
hist(cfb$INCOME, breaks = 500, freq = T)
# log는 무한대
cfb<- transform(cfb, INCOME_log= log(INCOME + 1))
hist(cfb$INCOME_log, break=500, freq = T)

cfb<- transform(cfb, INCOME_sqrt = sqrt(INCOME + 1))
hist(cfb$INCOME_sqrt, break=500, freq = T)

?qqline
par(mfrow = c(1,3))
qqnorm(cfb$INCOME, main="INCOME")
qqline(cfb$INCOME)

qqnorm(cfb$INCOME_log, main="INCOME_log")
qqline(cfb$INCOME_log)

qqnorm(cfb$INCOME_sqrt, main="QINCOME_sqrt")
qqline(cfb$INCOME_sqrt)

skewness(cfb$INCOME) #8.083549
kurtosis(cfb$INCOME) #85.83009
skewness(cfb$INCOME_log)# -2.818555
kurtosis(cfb$INCOME_log)#27.38504
skewness(cfb$INCOME_sqrt)#3.115281
kurtosis(cfb$INCOME_sqrt)#20.51165

# 변동계수
data(trees)
dim(trees)
head(trees)
summary(trees)
# 질적으로 다른 데이터 
sd(trees$Height); #높이 6.371813
sd(trees$Girth);  #둘레 3.138139
sd(trees$Volume)  #체적 16.43785
sd(trees$Height); sd(trees$Girth); sd(trees$Volume);
#변동계수로 이질적 집단에 표준편차를 비교
sd(trees$Volume) / mean(trees$Volume) # 0.5448233
sd(trees$Girth) / mean(trees$Girth);  # 0.2368695
sd(trees$Height)/ mean(trees$Height)  # 0.08383964

#표준오차 : 표준편차/SQRT(N)
x = c(0,1,2,3,4,5,6,7,8,9,10,11)
sd(x)
(se<-sd(x)/sqrt(length(x)))
c(mean(x) - (2*se), mean(x) +(2*se)) # 2가아니라 1.97임 신뢰구간 95% 
c(mean(x) - (3*se), mean(x) +(3*se)) # 3은 99%

# 문제 iris에서 Sepal.Length 에 대해 표준오차 및 신뢰구간 95
install.packages("iris")
library(iris)
data(iris)
head(iris)
sd(iris$Sepal.Length)
(se<-sd(iris$Sepal.Length)/sqrt(length(iris$Sepal.Length)))
c(mean(iris$Sepal.Length) - (2*se), mean(iris$Sepal.Length) +(2*se)) 
c(mean(iris$Sepal.Length) - (3*se), mean(iris$Sepal.Length) +(3*se))

stderr<- function(x) sd(x,na.rm=T)/sqrt(length(na.omit(x)))
(se<-stderr(iris$Sepal.Length))
c(mean(iris$Sepal.Length) - (2*se), mean(iris$Sepal.Length)+(2*se)) #5.708111 5.978556

#문제1 평균100이고 표준편차 10인 정규분포에서 50이 나올 정규분포 함수값은?
#정규분포 함수값은?
(z1 = (50-100)/10)
dnorm(z1, mean=0, sd=1)
dnorm(50, mean=100, sd=10)

#문제) 비행기의 평균 비행시간은 120시간이라고 하자 비행시간이 정규분포이고
# 표준편차 30시간 가정, 9대 표본으로 추출할때와 36대를 표본으로 추출할 때
# 표본평균과 분산을 비교해보시오
t9= rnorm(9,120,30)
t36= rnorm(36,120,30)

t100 = rnorm(100,120,30)
t1000= rnorm(1000,120,30)
mean(t9) #112.4985
var(t9) #1180.337
mean(t36) #118.8513
var(t36) #1165.575
mean(t100) #126.5037
var(t100) #760.0185
mean(t1000) #120.2704http://127.0.0.1:40119/graphics/plot_zoom_png?width=1745&height=917
var(t1000) #934.5471

#표준오차로 비교해야함
stderr(t9) #11.45201
stderr(t36) #5.690087
stderr(t100) #2.756843
stderr(t1000) #0.9667197 # 모집단 : 표본이 많아지면 점점 정규분포에 가까워지고
# 표본이 많아지면 표준오차는 점점 줄어든다.

#문제2 x~( 평균300, 분산50^2)인 정규분포에서 P(x>370) 일 확률을 구하여라
#z점수 사용
# 조건 이를 시각적으로 표현해보시오


x=rnorm( 370, 300, 50)



zpoint= (370-300) /50
pnorm(zpoint) #0.9192433
1-pnorm(zpoint) #0.08075666 -> 8% 

(x<-rnorm(1000,0,1)) #표준 정규분포에서
curve(dnorm(x,0,1),-4,4,xlab="z", ylab = "f(z)")
z=seq(((370-300)/50),4,0.01)
lines(z,dnorm(z),type="h",col="grey")
points(((370-300)/50),dnorm(((370-300)/50)))

# 문제3 브랜드의 백열전구의 수명이 1500시간의 평균값과 75시간의 표준편차로 정규적으로 분포되어 있다.
# #  1) 백열 전구가 1410 시간보다 덜 오래 갈 확률은 얼마인가?\

zpoint= (1410-1500) /75
pnorm(zpoint) #0.1150697
1-pnorm(zpoint) #0.8849303

# #  2) 백열전구가 1563과 1648시간 사이의 오래갈 확률은 얼마인가?
zpoint= (1563-1500) /75
pnorm(zpoint) #0.7995458
1-pnorm(zpoint) #0.2004542

zpoint= (1648-1500) /75
pnorm(zpoint) #0.9757712
1-pnorm(zpoint) #0.0242288


# 계산해서 할 때는 -값이 나와서 그냥 진행이 되고 실제 값을 넣을 때는 자기 수를 그냥 넣어주면 된다.
# 1563과 1648시간 사이의 오래갈 확률 구간을그라프 상에서 시각적으로 표현해 보시요
# +이면 누적확률이고 -이면 거기 까지 인가.
# 3) 위의 구간을 정규분포 곡선으로 그려 그라프 위에 표시해 보시요

(x<-rnorm(1000,0,1)) #표준 정규분포에서 #밀도 함수 값으로 작도
curve(dnorm(x,0,1),-4,4,xlab="z", ylab = "f(z)")

z=seq(-4,(1410-1500) /75 ,0.01)
lines(z,dnorm(z),type="h",col="yellow")

Z=(1410-1500)/75
pnorm(Z) #0.1150697 * 100 = 11.5%


points(((1410-1500) /75),dnorm(((1410-1500) /75)))

z=seq(((1563-1500) /75),4,0.01)
lines(z,dnorm(z),type="h",col="red")
points(((1563-1500) /75),dnorm(((1563-1500) /75)))
 
z=seq(((1648-1500) /75),4,0.01)
lines(z,dnorm(z),type="h",col="blue")
points(((1648-1500) /75),dnorm(((1648-1500) /75)))

Z1 = (1648-1500) /75
Z2 = (1563-1500) /75
pnorm(Z1) - pnorm(Z2)
curve(dnorm(x,0,1),-4,4,xlab = "z", ylab = "f(z)")
z= seq((1563-1500) /75,(1648-1500) /75,0.01 )
lines(z,dnorm(z),type = "h",col="grey")



###문제4) dnorm, pnorm, qnorm, rnorm
#우리나라 사육 생후 18개월 황소 무게
#평균 500 표준편차 50kg
# 우량한우 무거운 순서대로 5% 선발
## 무게가 몇 kg이상 황소를 선발해야 하는가?

wkg = 0.95  # 상위 5%를 나타내는 백분위
kg = qnorm(wkg, mean = 500, sd = 50)
kg

?qnorm
qnorm(1-0.05, 500, 50)


(start<-qnorm(1-0.05, 500, 50)) 
(x<-rnorm(1000,0,1)) 
curve(dnorm(x,0,1),-4,4,xlab="z", ylab = "f(z)")
z=seq((start-500)/50,4,0.01)
#z=seq(0,4,0.02)
lines(z, dnorm(z),type="h", col="grey")

#####
#카이제곱분석( 범주형 데이터 )
x<-seq(1,10, .1)
par(mfrow=c(2,3))

plot(x, dchisq(x,6),type="l")
plot(x, dchisq(x,5),type="l")
plot(x, dchisq(x,4),type="l")
plot(x, dchisq(x,3),type="l")
plot(x, dchisq(x,2),type="l")
plot(x, dchisq(x,1),type="l")

(d<-data.frame(x=c("1","2","2","1"),y=c("A","B","A","B"),
               num=c(3,5,8,7)))

class(d)
str(d)
table(d)
(xt= xtabs(num~x+y, data=d))
margin.table(xt,1) #행으로
margin.table(xt,2) #열로
margin.table(xt)
prop.table(xt,1) # 분포

#install.packages("gmodels")
library(gmodels)
str(mtcars)
# 데이터 타입 == 범주형
# 범주형 데이터의 기본통계는 카운트
# 기대값 : expected = T

CrossTable(mtcars$vs, mtcars$am,expected = T)
18* 19/32      # 10.688
#18은 실제값: 
#카이제곱 : (관측 -기대도수)^2 / 기대도수
#d.f 자유도  1
#카이제곱 분포는 자유도에 따라서 분포함수가 다름

library(MASS)
CrossTable(infert$education, infert$induced, expected = T)
fisher.test(infert$education,infert$induced, alternative = "two.sided")

# 다음은 사이다 선호도 조사 결과
# 선호도에 차이가 있는지 검저하시오
# 귀무가설 : 사이다에 대한 선호도 차이가 없다.
# 대립가설 : 사이다에 해단 선호도 차이가 있다.
data<-textConnection(
  "사이다종류 관측도수
  1 14
  2 32
  3 17
  4 9 
  5 18")
(x<- read.table(data,header=T))

# 기대도수 : 18
(14 + 32 + 17 + 9 + 18) / 5
res<-((14-18)^2 + (32-18)^2 + (17-18)^2 +(9-18)^2+ (18-18)^2)/18 #16.3333
dchisq(res, 4) #0.001159516 
pchisq(res, 4) #0.997397
1-pchisq(res, 4)
chisq.test(x$관측도수) # 자유도 4,  p-value = 0.002603
#X-squared = 16.3333 , df = 4 , p-value = 0.002603
#귀무가설을 기각하고 대립가설을 채택한다. = 사이다 제품간에 유의미한 선호차이가 있다 


#문제 독립성검정 
str(survey)
# 가설 성별과 운동량에는 별 차이가 있는지 알고 싶다
# 귀무가설 : 성별과 운동량은 관계가 없다.
# 대립가설 : 성별과 운동량은 관계가 있다.

 
chisq.test(survey$Sex,survey$Exer) #X-squared = 5.7184, df = 2, p-value = 0.05731
# 귀무가설 : 성별과 운동량은 관계가 없다. 

sum(is.na(survey))
survey<- na.omit(survey)
sum(is.na(survey))
head(survey[c("Sex","Exer")])

#카이제곱 분석:  독립성 검정, 동질성 검정
# 기준: 기대도수
(xt<-xtabs(~Sex + Exer, data = survey))
CrossTable(survey$Sex,survey$Exer, expected = T)
#평가 : p= 0.125로서 귀무가설을 기각하지 못한다. 그러므로 성별과 운동량은 관계가 없다.

data<-read.csv("cleanDescriptive_1.csv", fileEncoding="utf-8",encoding="cp949")
str(data)

# 문제 : level과 pass 간에 관계가 있는지 알고싶다
# 부모의 학력 , 자녀의 대학 진학간에 관계가 있는지 분석해 보시오

sum(is.na(data))
data<- na.omit(data)
sum(is.na(data))
head(data[c("level","pass")])
(xt<-xtabs(~level + pass, data = data))
CrossTable(data$level,data$pass, expected = T)
fisher.test(data$level,data$pass, alternative = "two.sided")
chisq.test(data$level,data$pass)
#대립가설 : 관계가 있다

library(dplyr)
result <- data %>%
  select("level", "pass")
sapply(result, function(x) sum(is.na(x)))
(result<-na.omit(result))
CrossTable(x=result$level, y=result$pass, expected = T,) # p = 0.2507
chisq.test(x=result$level, y=result$pass)

# 평균검정
# 단일 표본 평균검정
x = c(65,78,88,55,48,95,66,57,79,81)
t.test(x, mu=75) # value = 0.4537
mean(x) # 71.2  71.2 == 75 # 유의미한 차이가 발생하지 않으면 동일하다.


?sleep
str(sleep)
attach(sleep)
# 수면제 약효
plot(extra ~ group, data= sleep)
#extra는 수면시간 늘었는지 줄었는지
var.test(extra[group == 1], extra[group == 2], data = sleep)
# var.test 분산비 테스트
with(sleep, t.test(extra[group==1], extra[group==2],
                   var.equal = T    ))

t.test(extra~group, data =sleep)
# t.test 평균 비교
# var.equal 등분산이다 
# p-value = 0.07919
# 수면제를 먹은집단과 안먹은 집단 차이가 없음 약효가 없음
# 귀무가설을 기각하지 못한다.
detach(sleep)

shapiro.test( rnorm(1000))
#정규분포 검정
#귀무가설 : 정규분포이다
#대립가설 : 정규분포가 아니다


library(iris)
with(iris, var.test(Sepal.Width,Sepal.Length))
#등분산테스트
#귀무가설 : 등분산이 아니다
#대립가설 : 분산이 동일하다
#p-value = 3.595e-14
# 귀무가설을 기각하고 대립가설을 채택한다. 고로 두 데이터는 등분산이다.

# 새로운 당뇨병 치료제를 개발한 제약사의 예
# 치료에 지대한 영향을 주는 외부요인을 통제하기 위해 10명의 당뇨병 환자를 선별하여 1달 동안
# '위약(placebo)'을 투여한 기간의  혈당 (X1)과 동일한 사람에 대해서 '신약(new medicine)'을 투여한 1달 기간 동안의
#  혈당 수치(x2)를 측정하여 짝을 이루어 혈당 차이를 유의수준 5%에서 비교하시요
# 데이터
x1 <- c(51.4, 58.0, 45.5, 55.5, 52.3, 50.9, 52.7, 50.3, 53.8, 53.1)
x2 <- c(50.1, 51.5, 45.9, 53.1, 51.8, 50.3, 52.0, 49.9, 52.5, 53.0)

# 독립 표본 t-검정 수행
result <- t.test(x1, x2, alternative = "two.sided", paired = FALSE)

# 결과 출력
print(result)

#평균 비교 : t.test(정규분포인 경우) , wilcox.text(비모수인 경우)
#정규분포인지 테스트 : shapiro.test
#t.test에서 고려해야할것
#짝데이터인지 (pairs)
#등분산인지 (vat.test)
shapiro.test(x1) #p-value = 0.7659 정규분포이다다
shapiro.test(x2) #p-value = 0.04861 정규분포가 아니다
var.test(x1,x2)  #p-value = 0.2073 등분산이다

t.test(x1, x2, alternative = c("greater"), 
       paired = T, #짝데이터인 경우
       var.equal = T,#등분산인 경우
       conf.level = 0.95) # 유의수준이 0.05인 경우
# p-value = 0.02987 유의미한 차이가 있음으로 해석할 수 있다
wilcox.test(x1,x2,  #p-value = 0.02987
            paired =T,
            var.equal=T,
            exact=F,
            conf.level = 0.95)
# p-value = 0.0124 유의미한 차이가 있음으로 해석할 수 있다
# 귀무가설을 기각 대립가설 채택 : 유의미한 차이가 있다.

# anova 분석 ( 3개 이상의 변수인 경우 ) :평균비(F분포)
# bartlett.test : 동질성테스트 : 귀무가설 : 분산이 동질적이다
# 스프레이 기기에 대한  효과를 분석
# 귀무가설 : 스프레이별로 효과 차이가 없다.
# 대립가설 : 스프레이별로 효과 차이가 있다.
data(InsectSprays)
attach(InsectSprays)
str(InsectSprays) # 6개의 스프레이 제품
xtabs(InsectSprays) # xtabs X축으로 카운트함

aov.out = aov(count ~ spray, data=InsectSprays)
# 6개의 스프레이에 대해 분산분석(anova) summary를 해야 결과가 나옴
summary(aov.out) # 0일때 귀무가설을 기각하고 대립 채택 = 스프레이간 효과차이가 있다다

TukeyHSD((aov.out))

# F 분포도 자유도에 영향을 받아서 자유도에 따라서 밀도함수의 모양이 바뀐다
# 문제 : Cars93 데이더 생상국 USA vs non-USA(Origin) 
# price 평균이 차이가 있는지 테스트 신뢰 95%
# Origin 변수와 price 변수간 관계
# 가설설정 
# 귀무가설 가격차이가 없다
# 대립가설 가격차이가 있다
# 연구환경 
library (MASS)
data(Cars93)
?Cars93
head(Cars93)
str(Cars93)
summary(Cars93$Origin)
 
# 유의수준 :95% 신뢰구간

# 분석방법 :  평균비교 또는 비모수 평균 검정
shapiro.test(Cars93$Origin) # 
shapiro.test(Cars93$Price) # p-value = 4.235e-07 정규분포이다 
var.test(Cars93$Origin,Cars93$Price)  #p-value = 0.2073 등분산이다


sum(is.na(Cars93))
Cars93<- na.omit(Cars93)
sum(is.na(Cars93))
head(Cars93[c("Origin","Price")])
(xt<-xtabs(~Origin + Price, Cars93 = Cars93))
CrossTable(Cars93$Origin,Cars93$Price, expected = T) 
chisq.test(Cars93$Origin,Cars93$Price)
#X-squared = 75.329, df = 73, p-value = 0.4029


data(Cars93)
attach(Cars93)
str(Cars93) # 6개의 스프레이 제품
xtabs(Cars93) # xtabs X축으로 카운트함

aov.out = aov(Price ~ Origin, data=Cars93)
# 6개의 스프레이에 대해 분산분석(anova) summary를 해야 결과가 나옴
summary(aov.out) # 0일때 귀무가설을 기각하고 대립 채택 = 스프레이간 효과차이가 있다다

TukeyHSD((aov.out))
detach(Cars93)
# 유의확률 (p-value)
#p-value = 0.4029
#aov p-value= 0.3368302

# 결과를 해석
#0.05 보다 큼  귀무가설을 기각할 수 없음 가격차이가 없다