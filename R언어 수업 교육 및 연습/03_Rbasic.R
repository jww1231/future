(x<-1:10)
rnorm(100, mean = 5, sd = 3) #random + norm( 정규 분포) 
(x = rnorm(100)) #표준정규분포(평균은 0, 표준편차는 1)# 이론적으로 무한대까지 나옴
(su<-sum(x))
mean(x)

su/100

var(x)
(varresult <- sum((x-mean(x))^2)/(100-1)) # 분산에서는 자유도 (N-1) 

sdreault<-sd(x) #standard deviation 표준편차
sqrt(varresult)

#se : standard error 표준오차 : 표준편차 / sqrt(n)
sdreault / sqrt(100)


#변동계수
sdresult / mean(x)

#범위
range(x)
diff(range(x))

# IQR은 INTER QUANTILE RANGE
IQR(x) # 1.366769
quantile(x,0.75) - quantile(x,0.25) # 1.366769 

summary(x) # min, 1st Qu. , mean, median , 3rd Qu, max

boxplot(x)

# 균등분포 (uniform) : 확률이 동일
uni <- runif(100)
max(uni)
min(uni)
median(uni)
prod(uni)
order(uni)
table(uni) # 도수분포표표
table(x) #소수점이 있는 숫자(구간값을 생성) -> 정수에 대하여

abs(-5)
log(10)# 자연로그 밑수가 e : 2.714
log10(10)

(x<-c(1.5, 2.5, -1.3, 2.5))
round(mean(x)) # 반올림
ceiling(mean(x))# 올림
floor(mean(x)) # 내림

# 범주화
(x<- -5:5)

cut(x, breaks=2) # 구간 범주화 : 개수(정분) - 두개의 구간으로 범주화화
cut(x, breaks=c(-6,2,10)) # 구간범주화의 범위 0~20 20~30 범위가 다를때 이걸 사용해라

(x<-c(12,1,25,12,65,2,6,17))
result<-cut(x,breaks = c(0,3,12,15,20,80), # 5개로 구간화
    labels = c("First","Second","Third","Fourth","Fifth"))

table(result)

library (MASS)
str(Cars93) # 93 x 27 data.frame
#  $ MPG.highway 고속도로 연비
hist(Cars93 $ MPG.highway ) # 구간범주화 자동 + table( 도수분포표 ) => 시각화 
# 히스토그램은 연속적이라 붙어있음
# 이산적은 떨어져있음

disc_1<-Cars93[ , c("Model","MPG.highway")]
head(disc_1)

within( Cars93,{MPG.highway >= 20& MPG.highway < 25})
range(disc_1["MPG.highway"])

(disc_1<- within(disc_1,{
  MPG.highway_cd = character(0) # 변수생성
  MPG.highway_cd[MPG.highway >=20 & MPG.highway <25] = "20~25"
  MPG.highway_cd[MPG.highway >=25 & MPG.highway <30] = "25~30"
  MPG.highway_cd[MPG.highway >=30 & MPG.highway <35] = "30~35"
  MPG.highway_cd[MPG.highway >=35 & MPG.highway <40] = "35~40"
  MPG.highway_cd[MPG.highway >=40 & MPG.highway <45] = "40~45"
  MPG.highway_cd[MPG.highway >=45 & MPG.highway <50] = "45~50"
  MPG.highway_cd = factor(MPG.highway_cd, # 범주화
                          level = c("20~25" , "25~30","30~35","35~40","40~45","45~50"))
  
}))

str(disc_1)
head(disc_1)
summary(disc_1)
attributes(disc_1$MPG.highway_cd)
table(disc_1$MPG.highway_cd)
hist(disc_1$MPG.highway_cd)
# apply계열 1행, 2열 각데이터에 함수를 적용
tapply(disc_1$MPG.highway, disc_1$MPG.highway_cd, sum)
tapply(disc_1$MPG.highway, disc_1$MPG.highway_cd, mean)
tapply(disc_1$MPG.highway, disc_1$MPG.highway_cd, sd)

#install.packages("ggplot2")
library(ggplot2)
# dev.off()
ggplot(disc_1, aes(x=MPG.highway_cd, fill=MPG.highway_cd)) + geom_dotplot(binwidth = 0.3)
ggplot(disc_1, aes(x=MPG.highway_cd, fill=MPG.highway_cd)) + geom_bar()

# 4분위수 범주화
disc_1 <- within( disc_1, {
  MPG.highway_cd2 = character(0)
  MPG.highway_cd2[ MPG.highway <  quantile(MPG.highway, 0.25) ] = "1Q"
  MPG.highway_cd2[ MPG.highway >= quantile(MPG.highway, 0.25) & MPG.highway < quantile(MPG.highway, 0.50) ] = "2Q"
  MPG.highway_cd2[ MPG.highway >= quantile(MPG.highway, 0.50) & MPG.highway < quantile(MPG.highway, 0.75) ] = "3Q"
  MPG.highway_cd2[ MPG.highway >= quantile(MPG.highway, 0.75) ] = "4Q"
  MPG.highway_cd2 = factor(MPG.highway_cd2,
                           level = c("1Q", "2Q", "3Q", "4Q"))
})
head(disc_1)
(table(disc_1$MPG.highway_cd2))
tapply(disc_1$MPG.highway, disc_1$MPG.highway_cd2, mean)

# 개수로 범주화 : 연비 데이터를 정렬하고 순서대로 번호를 매긴다음 4구간으로 범주화 하시오
(disc_1 <- disc_1[order(disc_1$MPG.highway),])
disc_1$N <- seq(1:length(disc_1$MPG.highway))

disc_1 <- within(disc_1,{
  MPG.highway_cd3 = character(0)
  MPG.highway_cd3 [ N <= 23] = "1st_Freq"
  MPG.highway_cd3 [ N <= 24 & N<= 46 ] = "2nd_Freq"
  MPG.highway_cd3 [ N <= 47 & N<= 69 ] = "3rd_Freq"
  MPG.highway_cd3 [ N <= 70] = "4th_Freq"
  MPG.highway_cd3 = factor(MPG.highway_cd3,
                           level = c("1st_Freq","2nd_Freq","3rd_Freq","4th_Freq"))
  
  
})
head(disc_1)
#one - hot - encoding 범주형의 정규화 (신경망 반드시 실행)
# 회귀분석에서는 2개까지는 안해도됨
# 정규화 : 종속변수에 동일한 영향을 가진 독립 변수로 변화
# 범주형 : 범주가 5개일때  0.2 , 0.4  0.6  0.8  1.0

Quter <- c("E1","E2","E3","E4","E1","E2","E3","E4")
Productcount <-  c(30,80,40,10,28,75,39,6)
TS <- data.frame(Quter,Productcount, stringsAsFactors = F)
TS <- transform(TS,
                Quter1 = ifelse(Quter == "E1",1,0), # 3항 연산자자
                Quter2 = ifelse(Quter == "E2",1,0), 
                Quter3 = ifelse(Quter == "E3",1,0),
                Quter4 = ifelse(Quter == "E4",1,0))
TS

# 정규화
min_max_norm <- function(x) { # vector
  (x - min(x) ) / ( max(x) -min(x) )
}

head(iris)# 나팔꽃 , 꽃잎과 꽃받침을 이용해서 나팔꽃의 종을 분류
# 종이 3가지 = 범주형 3가지 
str(iris) # 종마다 50개씩

iris

# 주소만 전달하기 때문에 ()를 붙이지 않음
lapply(iris[1:4], min_max_norm) # 열방행으로 처리해라
mode(lapply(iris[1:4], min_max_norm)) #list
# for, if 문이 : 함수형 프로그래밍 
# 객체 지향 프로그래밍 => 클래스 => 함수형 프로그래밍 ( 객체 지향 프로그래밍을 구조적 프로그래밍으로 )

iris[1:4]
# 함수의 리턴값이 중요
iris_norm <- as.data.frame(lapply(iris[1:4],min_max_norm))
head(iris_norm)
iris_norm$Species <- iris$Species
head(iris_norm)

#Z 점수 정규화 ( z = (x-mu)/sigma) -> 표준정규분포
head(iris)
iris$Sepal.Length<-(iris$Sepal.Length-mean(iris$Sepal.Length)) / sd(iris$Sepal.Length)

z_normal <- function(x){ # 기본적으로 vector
  (x-mean(x) / sd(x))
}
iris_norm <-as.data.frame(lapply(iris[1:4],z_normal))
iris_norm

iris_standardize <- as.data.frame(scale(iris[1:4]))
iris_standardize

?scale

summary(iris)
str(iris)
head(iris)
tail(iris)
dim(iris)
length(iris) # 벡터의 length 행수, data.frame의 length는 열의 개수
NROW(iris)
names(iris) #열 이름 줄때, 열 확인이 가능
class(iris) # " data.frame"
sapply(iris,class) #열별로 "character" 문자 벡터 : 리턴 데이터 타입을 확인
mode(sapply(iris,class))
boxplot(iris)

ir <- iris
head(ir)
IQR(ir$Sepal.Width)
mean(ir$Sepal.Width)

(ir$Sepal.Width = ifelse(ir$Sepal.Width>1 , ir$Sepal.Width,NA))
is.na(ir[,2]) # 결측치 확인함수

#install.packages("dplyr")
library(dplyr) 
#ir %>% filter(!is.na(ir)) # 이름은 동일한데 다름름

summary(iris[,1])
fivenum(iris[,1], na.rm = TRUE)
?fivenum #(minimum, lower-hinge, median, upper-hinge, maximum)

outdata<- iris[1:4]
for(i in 1:(ncol(outdata)-1)){ # 자바의 for in 문과 동일일
  uppercut = fivenum(outdata[,i], na.rm=T)[4]+1.5*IQR(outdata[,i], na.rm=T) # 상한치
  lowercut = fivenum(outdata[,i], na.rm =T)[2]-1.5*IQR(outdata[,i], na.rm=T) # 하한치
  out<-filter(outdata, outdata[,i]<=uppercut , outdata[,i]>=lowercut)
} 
str(out)

?weather 
str(weather)
install.packages("forecast")
library(forecast)
str(weather)

?mtcars
head(mtcars)
str(mtcars)   #32x11
(exdata <- mtcars[1:10,1:3])
class(exdata)
print(exdata)
# apply를 이용해서 mtcars에서 추출된 exdata 의 열별 합계
# tapply 이용해서 exdata의 실린더 별 연비의 평균 분산 표준편차를 구해주세요
# tapply(exdata$mpg,exdata$cyl, c(mean,var,sd))
(apply(exdata,2,sum))

datamean<-tapply(exdata$mpg, exdata$cyl, mean)
datavar<-tapply(exdata$mpg, exdata$cyl, var)
datasd<-tapply(exdata$mpg, exdata$cyl, sd)

result<-rbind(datamean,datavar,datasd)
rownames(result)<-c("평균","분산","표준편차")
result

#각 열의 클래스 타입을 확인하시오

class(exdata$mpg)
class(exdata$cyl)
class(exdata$disp)

apply(exdata, 2, class)
lapply(exdata, class)
sapply(exdata, class)

class(apply(exdata,2,class))
class(lapply(exdata,class))
class(sapply(exdata,class))

(mat <- matrix(rnorm(20),nrow=5, ncol=4))
#문제 :  행으로 1사분위수와 중위수 3사분위수를 출력하시오

apply(mat, 1, quantile, probs=c(0.25,0.5,0.75))

# apply를 데이터 외의 함수에 적용


state_table <-
  data.frame( key=c("SE", "DJ", "DG", "SH", "QD"),
              name=c(" 서울", "대전", "대구", "상해", "칭따오"),
              country=c("한국", "한국", "한국", "중국", "중국"))
state_table
# 년도
month_table <-
  data.frame(key=1:12,
             desc=c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
             quarter=c("Q1","Q1","Q1","Q2","Q2","Q2","Q3","Q3","Q3","Q4","Q4","Q4"))
month_table
# 상품 테이블
prod_table <-
  data.frame(key=c("Printer", "Tablet", "Laptop"),
             price=c(225, 570, 1120))

prod_table
(prod_table1 <- data.frame(Printer=225,Tablet=570, Laptop=1120 ))

(prod_table1 <-t(prod_table1))

prod_table
names(prod_table)
row.names(prod_table)

row.names(prod_table)<-c("Printer", "Tablet", "Laptop")
prod_table["Tablet",]
prod_table[prod_table["key"]=="Tablet"][2]
prod <- sample(prod_table$key, 5, replace=T, prob=c(1, 3, 2))
prod
class(prod)


gen_sales <- function(no_of_recs) {
  loc <- sample(state_table$key, no_of_recs, replace=T, prob=c(2,2,1,1,1))
  time_month <- sample(month_table$key, no_of_recs, replace=T)
  time_year <- sample(c(2012, 2013), no_of_recs, replace=T)
  prod <- sample(prod_table$key, no_of_recs, replace=T, prob=c(1, 3, 2))
  unit <- sample(c(1,2), no_of_recs, replace=T, prob=c(10, 3))
  
  amount <- unit*prod_table1[prod,1]
  
  
  
  sales <- data.frame(month=time_month,
                      year=time_year,
                      loc=loc,
                      prod=prod,
                      unit=unit,
                      amount=amount)
  
  sales <- sales[order(sales$year, sales$month),]
  row.names(sales) <- NULL
  return(sales)
}

sales_fact <- gen_sales(500)
sales_fact
str(sales_fact)
head(sales_fact)
tail(sales_fact)

(revenue_cube <- 
tapply(sales_fact$amount,
       sales_fact[,c("prod","month","year","loc")],
       FUN = function(x){return(sum(x))}))

tapply(sales_fact$amount,
       sales_fact[,c("loc")],
       FUN = function(x){return(sum(x))})

scube<-revenue_cube[c("Tablet","Laptop"), , ,]

scube
revenue_cube[ ,"1","2012", ] # dicing
revenue_cube[ ,"3","2013", ]
revenue_cube["Laptop" ,"3","2013", ]
revenue_cube["Tablet","1","2012",] # 세목별로 # slicing

revenue_cube
# roll-up 상세는 숨기고 위의내용을 보는것
apply(revenue_cube, c("year","prod"),FUN=function(x){ return(sum(x,na.rm = TRUE))})
apply(revenue_cube, c("prod","year"),FUN=function(x){ return(sum(x,na.rm = TRUE))})

# 문제 : 제품별로 연도별, 월별 매출을 확인하시오
(revenue_cube <- 
    tapply(sales_fact$amount,
           sales_fact[,c("month","year","prod")],
           FUN = function(x){return(sum(x))}))
 


# 문제 : 매장별 제품별로 월별 매출액을 확인하시오

(revenue_cube <- 
    tapply(sales_fact$amount,
           sales_fact[,c("prod","month", "loc")],
           FUN = function(x){return(sum(x))}))

(revenue_cube <- 
    tapply(sales_fact$amount,
           sales_fact[,c("loc","prod","month" )],
           FUN = function(x){return(sum(x))}))











