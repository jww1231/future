# EDA(Exploratory data analysis)
# 시각화의 목적 : 비교, 구성, 분포, 관계, 추세, 변동
# 시각화 함수
  # 이산적 데이터 출력(barplot,stem) - 범주형 데이터 카운트
  # 연속적 데이터 출력(plot,histogram,boxplot) - 산포도
  # 모델의 결과를 출력(qqnorm,pairs, curve(방정식))
# 
data(cars)
str(cars) #차량속도, 제동거리 50x2
head(cars)
plot(cars$speed, type="l") #line 축을 표현하는 값이 한개
#speed는 y축  x축은 누가결정하나 (인덱스가 결정)
plot(cars$dist, type="l") 



plot(cars,type="p") #point # x축, y축
plot(cars,type="b") #b가both(line + point)
plot(cars,type="b",pch =21)
plot(cars,type="l",pch="+",cex=2,col="red",xlab="speed",ylab="distance",xlim=c(10,20),ylim=c(10,40),lty="dotdash") # lty == line type임 
?plot
identify(cars$speed,cars$dist)
text(cars$speed, cars$dist,pos=1)

#동전을 던지고 (4번) 앞면이 몇번 출력
coin<-c(2, 2, 0, 1, 1, 1, 2, 3, 1, 2, 2, 3, 3, 4, 1, 3, 2, 3, 3, 1, 2, 2, 1, 2, 2)
(frequency<-table(coin)) #범주 -> 카운트( 도수 분포표 )
# 상대도수 분포표
(relative <- frequency/length(coin)) # 전체가 1일때 %로 표현가능하게 바꾼것 상대도수 분포표
sum(relative)

#누적도수 분포표
(cumulative<-cumsum(relative))

#화면 분할
(opar<- par(mfrow = c(1,4))) #리턴값은 나누기 전의 화면구조 변수에 저장하는이유는 나누고 돌아가기 위해

plot(frequency, xlab = "값", ylab = "도수", type = "b", col = "red", main= "도수",
     sub="순수도수", frame.plot =F , panel.first = T )
plot(1:5,frequency, xlab = "값", ylab = "도수", type="b", col="red", frame.plot = F)
plot(round(relative,2),type="b",pch=23,col="red")
plot(round(cumulative,2),type = "b" ,col = "red", axes = F)
par(opar) #원래의 화면 분할로 복귀

opar<-par(mfrow=c(1,3)) # 화면을 분할해서 쓸수 있음
barplot(frequency, xlab="값" , ylab = "도수", col="blue", border = T, 
        density = T, horiz = T, main = "도수분포표") # density 밀도 사선이 그려짐짐 horiz 수평이 바뀜
barplot(round(relative,2),xlab = "값", ylab = "도수", col="red", main ="상대도수분포표")
barplot(round(cumulative,2),xlab = "값", ylab = "도수", col = "red",
        main = "누적상대도수분포표")
par(opar)


(opar<- par(mfrow = c(1,1)))
x=1:720
library(NISTunits)
x<-NISTdegTOradian(x) #주기성이 있는 데이터는 삼각함수가 나타남


# radian으로 치환하지 않아서 오류 발생함
plot(x,sin(x), # 주파수 별로 출력력
     main="사인함수",
     ylab="sin(x)",
     type="l",
     col="blue")


library(MASS)

str(Boston)
Boston$tax
plot(density(Boston$tax, bw=5)) # 보간법 (interporation)
# 보간법 : 없는 값은 추정한다 
# spline으로 부드럽게 나타난다 (연속적인 선으로 표현)
# 그라프 중복을 표현하는 방법이 없음
# rug와 jitter잡음으로 표현 : 밀도 확인할 수 있도록 표현
# 정규분포
rug(Boston$tax + rnorm(length(Boston$tax),sd=5),col=2,lwd=3.5)
#러그로 실제데이터 위치 표시

?Boston # 집값 예측 506x 14

#패키지간에 함수이름이 중복되는 경우가 있음 그래서 함수를 포뮬라로 바로 불러와서 사용
x<-stats::runif(12); # 균등분포 stats에 있는 runif함수를 가져옴
y<-stats::rnorm(12)  
i<-order(x,y); x<- x[i]; y<-y[i]
plot(x,y, main= "arrows(.) and segments(.)")
(s <- seq(length(x)-1)) #맨마지막은 화살표를 그리지않아서 -1을 빼준다

#선
arrows(x[s],y[s],x[s+1],y[s+1],col=1:3)
(s<-s[-length(s)])
segments(x[s],y[s],x[s+2],y[s+2],col='pink')

(x=(0:100)*pi/10)
amp.1 <- 2 # amp 진폭
amp.2 <- 2
amp.3 <- 5
amp.4 <- 5
wav.1 <- 1 # wav 주기
wav.2 <- 2
wav.3 <- 3
wav.4 <- 7
signal.1 <- amp.1*sin(wav.1*x) # -1 ~ 1까지 : 앞에서 곱해지는 것 : 진폭
signal.2 <- amp.2*sin(wav.2*x) # 주기가 빨라짐 고주파가 됨-> 분석석
signal.3 <- amp.3*sin(wav.3*x) 
signal.4 <- amp.4*sin(wav.4*x) 
(opar<-par(mfrow =c(1,4)))
plot(x,signal.1,type = 'l', ylim=c(-5,5)); abline(h=0, v=0, lty=3)
plot(x,signal.2,type = 'l', ylim =c(-5,5)); abline(h=0, lty=3)
plot(x,signal.3,type = 'l', ylim =c(-5,5)); abline(h=0, lty=3)
plot(x,signal.4,type = 'l', ylim =c(-5,5)); abline(h=0, lty=3)
par(mfrow = c(1,1))


par(mfrow=c(1,2))
str(cars)
plot(cars$dist, type="o", cex = 0.5, xlab="speed" , ylab = "dist")
tapply(cars$dist, cars$speed, mean) #x 축에 여러번 나타나는 경우 평균값으로 표현
plot(tapply(cars$dist, cars$speed, mean),type="o",cex =0.5,
     xlab="speed", ylab = "dist")
par(mfrow=c(1,1))

#install.packages("mlbench")

library(mlbench)
data(Ozone)
str(Ozone)
head(Ozone)
opar<-par(mfrow=c(1,2))
plot(Ozone$V6,Ozone$V7,xlab = "windspeed" ,ylab = "Humidity", #풍속 #습도
     main = "Ozone")
plot(jitter(Ozone$V6),jitter(Ozone$V7),xlab="windspeed", ylab="Humidity",main="Ozone") #지터를 사용함 사용한이유 중복을 표현하기 위해서
par(opar)

#선형회귀 그라프
#데이터 예측선을 구한것
#실제값하고 예측값하고 차이가 발생함
# +- 상계를 방지하기 위해서 제곱을 구한다음 더한 값이 최소가 되는 (최소제곱법)
# 직선을 구하는것이 선형회귀(기울기 + 절편)
# 선형회귀의 결과는 점추정 -> 구간추정(표준오차)
# 평균 +- 표준오차 *2 (95% 신뢰구간) *3(99.7% 신뢰구간)

# formula 종속 ~ 독립변수
(m<-lm(dist ~ speed, data = cars)) # linear model
# 절편, 기울기
# dist = 3.932 * speed -17.579 
#  y   =   ax + b
3.932 * 10 -17.579 # 21.741 점추정 # 예측을 일반화하기 위해서 선형회귀를 한다
plot(cars)
abline(m) # 직선 또는 수직선 # 회귀선이 그려짐 # fit는 예측값 lwr = lower 하한치, upr = upper 상한치
# 추정할때 구간추정을 해라 틀릴확률을 줄이기 위해서
# 원래 데이터에 대하여 추정하라
(p<-predict(m, interval = "confidence")) # 95% 신뢰구간으로 예측
head(p)


# rev = reverse 거꾸로 
# cars$speed
#  [1]  4  4  7  7  8  9 10 10 10 11 11 12 12 12 12 13 13 13 13 14 14 14 14 15 15 15 16 16 17 17 17 18 18 18 18 19 19 19 20 20 20 20 20 22 23 24
# [47] 24 24 24 25
# rev(cars$speed)
#[1] 25 24 24 24 24 23 22 20 20 20 20 20 19 19 19 18 18 18 18 17 17 17 16 16 15 15 15 14 14 14 14 13 13 13 13 12 12 12 12 11 11 10 10 10  9  8
#[47]  7  7  4  4

x<-c(cars$speed, tail(cars$speed,1), rev(cars$speed),
     cars$speed[1])
# fit        lwr       upr

y<-c(p[,"lwr"], tail(p[, "upr"],1),rev(p[,"upr"]),
     p[,"lwr"][1])
#rgba(alpha 투명도도)
polygon(x,y,col=rgb(.7,.7,.7,.5)) # 닫힌 다각형형



opar <- par(mfrow=c(1,1))
plot(cars)
lines(lowess(cars)) # 비선형 회귀

# 문제 : women 데이터의 weight와 height 데이터 간의 선형회귀 선을 그리시오
str(women)
head(women)
summary(women)

(m2<-lm(weight ~ height, data = women)) # linear model
# weight = 3.932 * height -17.579 

plot(women)
abline(m2)  


(p2<-predict(m2, interval = "confidence"))  
head(p2)

x2<-c(women$height, tail(women$height,1), rev(women$height),
      women$height[1])
y2<-c(p2[,"lwr"], tail(p2[, "upr"],1),rev(p2[,"upr"]),
     p2[,"lwr"][1]) 
polygon(x2,y2,col=rgb(.7,.7,.7,.5)) # 닫힌 다각형형


#3개의 변수를 가진 데이터터
str(trees)
summary(trees)
Height2 <- trees$Height^2 #파생변수
(trees2 <- cbind(trees, Height2))
attach(trees2) # 데이터를 마치 패키지처럼 메모리에 상주
(test2<-lm(Girth~ Height + Height2)) #trees2$Girth
Girth = -0.133717 *Height + 0.002602*Height2 + 8.276598
plot(Girth ~ Height)
fitted(test2)
lines(sort(Height),fitted(test2)[order(Height)],col='red',
      type='l')
detach(trees2) # 패키지에서 제거됨

##########################################
# norm : 선행대수에서는 벡터의 크기
(x <- rnorm(1000 , mean = 100 ,sd = 1)) # random+ norm 정규분포
qqnorm(x) # 정규분포
qqline(x, lty = 2) 

x<- runif(1000)
qqnorm(x)
qqline(x, lty=2)
# (공분산분해) -> 상관계수 : 정방행렬 / 대칭행렬 => 고유값분해 (eigen)
# 고유값(크기값) + 고유벡터 ( 직교 행렬 ) 방향값을 나타냄
# 고유값이 크다는 것은 분산이 크다는 것 
# 주성분 분석 (PCA)

pairs(mtcars, main = "mtcars 데이터")

data(iris)
head(iris)
x<-iris$Sepal.Length
# 히스토그램은 연속적인 수치를 구간범주화 -> 카운트해서 자동으로 작성됨
# 상대도수로 출력
hist(x, prob=T, col="skyblue", border = "white")
lines(density(x)) # 보간법  (interpolation) 없는 데이터는 추정을 통해서 진행됨
# 선형보간법 , spline보간법 곡선을 그리는 방법으로 전과 그 후 데이터를 보고 선형으로 표현됨
boxplot(x)

# 벡터에 행이름 부여
honeymoon<-c(12,14,8,9)
names(honeymoon) <- c("하와이", "동남아","유럽","기타")
pie(honeymoon, col = rainbow(4))
per<- round(100*honeymoon/sum(honeymoon),1)
lab<- paste(names(honeymoon),"\n",per,"%")
pie(honeymoon, labels = lab, col = rainbow(4))

# pie의 원점은 중심
text(-0.5, 0, "32.6%",col="black") #내부값 입력됨
text(0.3,0.3,"30%", col="black")
text(0, -0.5,"20%",col="black");
text(0.5, -0.3,"20.9%",col="black")

par(mfrow=c(1,1))
#산포도
plot(mtcars$wt, mtcars$mpg) #차무게 / 연비
# 역상관관계

library(ggplot2)
ggplot(mtcars, aes(x=wt,y =mpg))+
geom_point() # 산포도

BOD # Biochemical Oxygen Demand
barplot(BOD$demand, names.arg = BOD$Time)
table(mtcars$cyl) #데이터 요약(도수분포표)
barplot(table(mtcars$cyl))

ggplot(BOD,aes(x=Time, y=demand))+ 
  geom_col()

curve(x^3 - 5*x, from = -4, to = 4) # 변곡점 2개

# 배기량과 연비의 관계
qplot(displ, hwy, data = mpg)
# drv는 4륜구동 , 전륜구동 ,  후륜구동별로 컬러가 들어감
qplot(displ, hwy, data = mpg, color=drv)

qplot(hwy, data=mpg ,fill=drv)
qplot(hwy, data=mpg ,fill=drv,binwidth=2  ) # binwidth는 구간범위를 나타냄 : 구간범위를 늘리면 구간개수가 줄어듬
qplot(hwy, data=mpg ,fill=drv,binwidth=2 , facets=.~drv,)# 화면분할 : facets
qplot(hwy, data=mpg ,fill=drv,binwidth=2, shape=factor(cyl) ) # shape는 여기선 안되나 드라이브별로 출력모양이 달라짐

qplot(wt, mpg, data=mtcars, size=qsec, color=factor(carb), shape=factor(cyl))# qsec은 가속력


?diamonds
qplot(clarity, data=diamonds)# 도수분포를 자동으로 만들어줌
qplot(clarity, data=diamonds, fill=cut , geom = "bar") #순도에 따른 구성비

ggplot(mpg, aes(x=hwy, fill=drv))+geom_bar()

g<- ggplot(mpg,aes(class)) # 변수에 저장 : class 별로 도수 분포표
g + geom_bar()
g + geom_bar(aes(weight= displ)) # 배기량
g + geom_bar(aes(fill =drv)) 

g+ 
  geom_bar(aes(fill = drv), position = position_stack(reverse = T))+
  coord_flip() + #좌표계 변환
  theme(legend.position = "top") #범례의 위치조정
g+ 
  geom_bar(aes(fill = drv), position = position_stack(reverse = F))+
  coord_flip() + #좌표계 변환
  theme(legend.position = "bottom") #범례의 위치조정

g+ 
  geom_bar(aes(fill = drv), position = position_stack(reverse = F))+ #좌표계 변환
  theme(legend.position = "top")  #coord_flip() + #좌표계 변환 이걸쓰면 세로 가로 바뀜

g+ 
  geom_bar(aes(fill = drv), position = position_stack(reverse = T))+
  coord_flip() + #좌표계 변환
  theme(legend.position = "top") +
  #ggtitle("Plot of length \n by dose")
  labs(title ="똥떵어리",
       x = "mpg", y = "테스트")

  ggplot(mpg, aes(x=hwy, y=cty)) + geom_point()+ylab('cty')+xlab('hwy')
  ggplot(mpg, aes(x=hwy, y=cty)) + 
    geom_point(position = position_jitter(w=0.2, h=0.2))+
    geom_smooth(method = "lm")
?theme

  ggplot(data = diamonds, aes(x=price))+
    geom_histogram(binwidth = 3000) +
    facet_wrap( ~ cut, nrow = 3) # 화면분할
  
  x_mean <- 1.5
  x_sd <- 1.2
  N<-500
  n<- ggplot(data.frame(x<- rnorm(N, x_mean, x_sd)),aes(x=x))+
    geom_bar() + stat_bin(binwidth = 0.5) +
    # 통계학 : 모집단 (비용, 시간) / 표본
    # 모집단의 평균 : 추정 , 분산, 표준편차
    # 표본
    # 문자열내에서 표현되는 수학기호 expression
    labs(title = substitute(paste( "Random 데이터 출력 ", # substitute 대체하라라 # paste 문자열을 결합하라라
                                   mu, "=",m,",", # mu : 모집단의 평균, sigma : 표준편차 , bar(x) : 표본 평균 , s^2 : 표본 분산
                                   sigma^2,"=",s2,",",
                                   "draws = ", numdraws, ",",
                                   bar(x), "=", xbar,",",
                                   s^2, ",", sde),
                            list(m=x_mean,xbar=mean(x),s2=x_sd^2,sde=var(x),numdraws=N)))

  print(n)  
  
  ggplot(mtcars, aes(mpg, wt))+
    geom_point() + 
    xlim(15,20)
  
  x<- seq(-4,4,len =101)
  y<- cbind(sin(x), cos(x))
  matplot(x,y,type = "l",text = "n",
          main = expression(paste(plain(sin)*phi,"  and  ", # plain 평번하게
                                  plain(cos)*phi)),
          ylab = expression("sin"*phi,"cos"*phi),
          xlab = expression(paste("Phase Angle ", phi)),
          col.main= "blue")
  
  
  library(maps)
  library(ggplot2)  
asia <- map_data("world", region = c("China","Japan",
                                     "North Korea", "South Korea","India"))  
str(asia)
asia <- map_data("world", region = c("North Korea", "South Korea"))  
ggplot(asia, aes(x=long, y=lat, group=group, fill=region)) + 
  geom_polygon(colour="black")+
  scale_fill_brewer(palette="Set1")

?theme

# 문제 
# 데이터 coin<-c(2, 2, 0, 1, 1, 1, 2, 3, 1, 2, 2, 3, 3, 4, 1, 3, 2, 3, 3, 1, 2, 2, 1, 2, 2)
# 도수분포표, 상대도수 분포표, 누적도수분포표를 하나의 그래픽으로 그리기

# 데이터 coin
coin <- c(2, 2, 0, 1, 1, 1, 2, 3, 1, 2, 2, 3, 3, 4, 1, 3, 2, 3, 3, 1, 2, 2, 1, 2, 2)

# 도수분포표
do <- table(coin)
# 상대도수분포표
sa <- do / length(coin)

# 누적도수분포표
nu <- cumsum(sa)

# 데이터 프레임 생성
df <- data.frame(coin = as.numeric(names(do)), do = as.numeric(do), 
                 sa = sa, nu = nu)

library(ggplot2)

ggplot(df, aes(x = coin)) +
  geom_line(aes(y = nu * max(do)), color = "blue") +
  geom_line(aes(y = do), color = "red") +
  geom_line(aes(y = sa), color = "green") +
  geom_point(aes(y = nu * max(do)), color = "black", size = 3) +
  ylab("도수 / 누적도수 / 상대도수") +
  theme_minimal()

# 후원자와 후원금에 대한 정리
# 후원자의 직업군, 후원금 규모, 고액 후원자, 후원자수의 비교
# 다양한 비교및 처리를 통해서 정보를 추출하는 것이 중요하다.
# 고액 후원자의 직업 성향으로 당의 특징을 파악해 보시요 ,

# 문제 election_2012.csv 파일을 로딩한 다음 다음 문제를 해결하시요
election<- read.csv(file.choose())
str(election)

# 문제1) 다음 데이터만 선택하여 작업하도록 data.frame을 준비하시요
#1. cand_id : 2. cand_nm : 대선 후보자 이름 , 3 . contbr_nm : 후원자 이름 4. contbr_occupation : 후원자 직업군 , 10. contb_receipt_amt: 후원금
df <- data.frame(
  cand_id = election$cand_id,
  cand_nm = election$cand_nm,
  contbr_nm = election$contbr_nm,
  contbr_occupation = election$contbr_occupation,
  contb_receipt_amt = election$contb_receipt_amt
)

df
# 문제2) 'Romney, Mitt'와 'Obama, Barack' 대령통 후보자 별로 서브셋(subset)을 생성하시요
#조건1) romney와 obama으로 저장 # 행을 롬니와 오바마로 저장
#조건2) 각 후보자의 데이터 수를 확인하고 그 내용을 head로 확인하시요
library(dplyr)
(romney <- df %>% filter(cand_nm == "Romney, Mitt"))
(obama <- df %>% filter(cand_nm== "Obama, Barack"))

nrow(romney)
nrow(obama)

head(romney)
head(obama)

# 문제3) romney와 obama 변수를 대상으로 후원금이 600달러 이상인 후원자를 추출하고 다음을 처리하시요
#조건1) 추출된 결과를 다음 변수에 저장하시요. romney_6000over, obama_6000over 여기로 저장
romney_6000over<- romney %>% filter(contb_receipt_amt >= 600)
romney_6000over

obama_6000over<- obama %>% filter(contb_receipt_amt >= 600)
obama_6000over

#조건2) 각 후보자별로 후원자 수를 파악하시요  ( 중복한 경우는 제거하고 )
romney_donors <- unique(romney_6000over$contbr_nm)
obama_donors <- unique(obama_6000over$contbr_nm)

romney_donors 
obama_donors

(romney_count <- length(romney_donors)) #35860
(obama_count <- length(obama_donors)) #26268

# 조건3) 각 후보자별로 가장 많은 후원금의 기부자의 이름과 직업군은?
# Romney 후보자의 가장 많은 후원금을 기부한 기부자 찾기 
romney_max_donation <- romney_6000over[which.max(romney_6000over$contb_receipt_amt), ]
romney_max_donation
# Obama 후보자의 가장 많은 후원금을 기부한 기부자 찾기
obama_max_donation <- obama_6000over[which.max(obama_6000over$contb_receipt_amt), ]
obama_max_donation 
 

print("Romney 후보자의 가장 많은 후원금 기부자의 직업:")
print(romney_max_donation$contbr_occupation)
 
print("Obama 후보자의 가장 많은 후원금 기부자의 직업:")
print(obama_max_donation$contbr_occupation)


# 문제4) romney와 obama 변수를 대상으로 직업군이 공백인 관측치를 제거하여 서브셋을 생성하시요
# 직업군이 공백인 관측치를 제거한 서브셋 생성
# 조건1> romney2, obama2 변수 저장
romney2 <- romney %>% filter(!is.na(contbr_occupation) & contbr_occupation != "")
obama2 <- obama %>% filter(!is.na(contbr_occupation) & contbr_occupation != "")

# 결과 출력
head(romney2)
head(obama2)

# <조건2> 공백 제거 전과 후 관측치 차이 계산  
a <- nrow(romney)
b <- nrow(romney2)
c <- nrow(obama)
d <- nrow(obama2)

# 관측치 차이 출력
print(paste("romney 관측치 차이:", a - b))
print(paste("obama 관측치 차이:", c - d))

# <조건3> romney2와 obama2 변수를 romney.csv와 obama.csv 파일 저장(행번호 제외)

# 'romney2'를 'romney.csv' 파일로 저장
write.csv(romney2, file = "romney.csv", row.names = FALSE)

# 'obama2'를 'obama.csv' 파일로 저장
write.csv(obama2, file = "obama.csv", row.names = FALSE)


# 문제 5) romney.csv, obama.csv 파일을 읽어와서 다음과 같이 처리하시오.
# <조건1> 저장할 변수명 : romney3, obama3
romney3<- read.csv(file.choose())
str(romney3)

obama3<- read.csv(file.choose())
str(obama3)
# <조건2> 후보자별 직업군이 'RETIRED'인 후원금만 추출하여 합계 계산
romney_re <- romney3 %>%  filter(contbr_occupation == 'RETIRED')
romney_re
sum(romney_re$contb_receipt_amt)

obama_re <- obama3 %>%  filter(contbr_occupation == 'RETIRED')
obama_re
sum(obama_re$contb_receipt_amt)
# 문제 6) romney3, obama3 변수를 대상으로 각 후보자별 가장 많은 후원자의 직업군 3개씩 확인하시오 
# 가장 후원자가 많은 직업군 3개씩 확인
# 로미니 후보의 가장 많은 후원자 직업군 3개 확인
romney_job <- romney3 %>% 
  count(contbr_occupation) %>% 
  arrange(desc(n)) %>% 
  head(3)

# 결과 출력
romney_job

# 오바마 후보의 가장 많은 후원자 직업군 3개 확인
obama_job <- obama3 %>% 
  count(contbr_occupation) %>% 
  arrange(desc(n)) %>% 
  head(3)

# 결과 출력
obama_job

