# data.frame 은 자료구조
# 열내 동질적 열간 이질적인 자료구조
# 열이 vector다
# vector, matrix에서는 데이터가 부족하면 recycling 되는데 data.frame은 안됨
x<-c(10,20,30,40)
y<-c(6,7,8,9)
#열이름 =  데이터
data<- data.frame(width=x, height=y)
data
str(data) # 데이터 프레임 정보 출력4X2 데이터 프레임
data$width # $접근 .=> $로 변경됨
data[,1] # 인덱싱
head(data) # 어떤 형태인지 간략하게 볼 수 있음
data$delinetr = c(30,40,50,60) # 실시간 추가
data

d.f <- data.frame()
d.f<- edit(d.f)

d.f

L3 = LETTERS[1:3]
d<-data.frame(cbind(x=1, y=1:10),fac = sample(L3,10,replace = TRUE))
d
d$fac
d["fac"]
names(d)
(d$yhat <- d$fac)
str(d)
head(d)# 6개를 보여줌
# 문자하고 범주형 데이터는 질이 다름
d$fac = factor(d$fac) # 범주형 데이터 : 양적데이터 / 질적데이터 (크다,적다, 아름답다:1, 밉다:2) 이게 범주화
                      # 범주화 맵핑 통계학에서는 질적데이터가 중요함 
                      # fac은 분석할수 없다
d
rownames(d) = c ("일","이","삼","사","오","육","칠","팔","구","십")
d
str(d)


x<- data.frame("SN"= 1:2, "AGE" = c(21,15), "Name"= c("에어콘","삼성SDS"))
str(x)
x<-data.frame("SN"=1:2, "Age"= c(21,15),"Name" = c("에어콘", "삼성SDS"), stringsAsFactors = FALSE)
x
x["Name"]
x$Name
class(x$Name) #"character" 형태를 잃어버리고 캐릭터 벡터가 되어버림
class(x["Name"]) #"data.frame" 데이터 프레임을 유지한다
x[["Name"]]
class(x[["Name"]])# "character" 요소 하나로 보자 
colnames(x) <- c("SS","AA","CC")
ncol(x)
nrow(x)
length(x) # 열의 개수가 나옴 : 벡터에 사용할때는 행의 개수 
str(x)

x["Age"]
# x["Age", 1] <- 20;
x
x[1,"Age"]<- 20; #
x
x$Age = NULL
x

data()
str(trees) # 나무가 성장할때의 Girth둘레 , Height높이, Volume 3가지 정보를 관찰
head(trees, n=3 )
tail(trees, n=3)
trees[2:3,]
trees[trees$Height > 82,]
trees[10:12,2]
trees[10:12,2,drop = FALSE]
 
class(trees[trees$Height > 82,])
class(trees[10:12,2]) #numeric vector로 출력
class(trees[10:12,2,drop = FALSE]) #drop = FALSE 데이터 프레임 속성을 유지
summary(trees) # 하한치 최소값 , 1사분위수(25), 중위수, 평균, 3사분위수, 최대값 상한치
               # 사분위수 데이터를 정렬해서 가운데 (median, )

boxplot(trees) #통계학은 평균이 중심 이상치는 평균에 지대한 영향을 미침
# inter quantile range : 3사분위수에서 1사분위 수를 뺀것
# 3사분위에서x 1.5배 더하면 상한치
# 1사분위에서x 1.5배 빼면 하한치

pairs(trees)
# pwd()
getwd()
data<- read.table("input.csv", header=T, encoding="UTF-8", fill= TRUE, sep=",", quote="")
data
?read.table
colnames(data)
print(is.data.frame(data))
print(ncol(data))
print(nrow(data))
(sal <- max(data$salary))
#데이터를 필터링
retval <- subset(data, salary == max(salary))
print(retval)
#부서가 HR인 사람
#문자열의 앞뒤 공백을 제거
#install.packages("stringr",dependencys=T)
library(stringr) #설치도 안되어있고고 로딩이 안된 라이브러리리
retval <- subset(data, str_trim(dept) == "IT")
print(retval)

# 문제 salary 600이상이고 dept가 Finance
retval <- subset(data,salary >= 600 & str_trim( dept) ==  "Finance")
print(retval)
# 날짜 : 입출력 : 문자열 
# 날짜로 만들때는 : casting : as.Date()
# is는 체크함수 as는 변환

retval <- subset(data, as.Date(start_date)> as.Date("2014-01-01"))
print(retval)
write.csv(retval,"output.csv")
(newdata<- read.csv("output.csv"))
# 한행을 제거
newdata[-2,]
retval <- newdata[-2,] # 열변수는 NULL로 제거함
# 결측치 처리 외엔 제거 잘하지 않음

# 문제  
retval$X=NULL
retval

#문제1 
#데이터 프레임에 입력
#         영어점수  등급
# 퀴즈    97        c
# 중간    92       "A"
# 기말    89       "B"

(data<-  data.frame("영어점수" = c(97,92,89) , "등급" = c("C","A","B")))
rownames(data)<- c("퀴즈","중간","기말")
  print(data)
 
  
#문제2 수학점수를 50, 100 , 80점으로 입력(열로 추가)
#data$delinetr<-NULL
data$"수학점수" = c(50,100,80)
data
  
#문제3 보충이라는 이름으로 dataframe을 만들어 rbind시키시오(행으로 추가)
# 영어점수 90 등급 "A", 수학점수 100
a<- data.frame("영어점수"= 90, "등급"="A", "수학점수"= 100)
rownames(a)<- "보충"
print(a)

data2<-rbind(data,a)
print(data2)
#문제4 열별합계를 계산 마지막행에 추가하시오
 

hab <- colSums(as.matrix(cbind(data2$"영어점수",data2$"수학점수")))
da= data.frame("영어점수"=hab[1],"등급"=0,"수학점수"=hab[2], row.names = "합계")
(datadf<-rbind(data2,da))

# 저장 (write.csv와 write.table의 차이)
write.table(data2,file = "sungjuk.csv", sep=",") # 행이름을 정상으로 로딩됨
(data3<-read.table("sungjuk.csv", header = TRUE, sep = "," ))

#열이름을 row.names를 사용해야 정상으로 로딩됨됨

write.csv(data2,file = "sungjuk.csv") #, qmethod = "double")
#(data4<-read.csv("sungjuk.csv", header = TRUE, sep = ","))
(data3<-read.csv("sungjuk.csv", header = TRUE, sep = ",",row.names = 1))
