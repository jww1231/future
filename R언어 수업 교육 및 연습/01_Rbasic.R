(a <- 2);
(b <- 5);
ls() #linux ( 파일리스트 -> 변수리스트 )
Sys.getenv("JAVA_HOME"); #자바도 기본적으로 설치하고 실행할 것
print(a);

x <-5;
x
typeof(x) #"double" 강제 형변환환 (숫자를 잘 구분)
mode(x)   # 문자, 숫자 , 논리 불린 구분
class(x)  # 클래스 종류 


# 데이터 타입을 변경하고 싶다(as.integer)
x = as.integer(x); # 자바에서는 클래스 내부참조
                   # .이 그냥 이름 
mode(x)
typeof(x)
# 객체지향 프로그램 -> 함수형프로그래밍 구조적 프로그래밍으로 생성
y<- x; # 값에 의한 대입
y

x+y
x*y
x-y
x/y
y%%x # 나머지 연산자 # R에서 %%는 연산자를 정의 할때 사용( 함수 )
y%/%x # 몫 연산자자
y^x #승수

x<-5; # 관계연산자가 if문 대신에 사용
y<-16;
x<y
x>y
x<=5
y==16
x!=5;
# R에서 true fals는 대문자로 TRUE,FALSE
x <- c(TRUE,FALSE,0,"6") #combination
x
# 문자 -> 숫자 -> boolean
x<-5
x+1
x
# R에서는 대입으로 값을 변경
(x<- c(TRUE,FALSE,0,'6'))
(y<- c(FALSE,TRUE,FALSE,TRUE) )
!y # 부정
x&y # 요소별로 판단
x && y #모든것이 참일때 참


t<- 1:10 # range 연산자
t
v2<- 15
v1 <- 8
v1 %in% t # 포함연산자
v2 %in% t


#벡터 연산은 벡터화 연산을 수행 : core가 6개 부동소수점 연산기
#matrix는 벡터가 모여있음 병렬연산
#데이터 프레임은 벡터 : 열로 적용됨 열내 동질적 열간 이질적적
#multi core를 사용해서 동시에 연산( ) : 병렬연산 
c(1,3,5,7,9) *2 # 요소별로 적용 (for문 없이 연산됨 )

c(1,3,5,7,9) * c(2,4) # 짝이 맞아야 한다다
c(1,3,5,7,9,10) * c(2,4) 
c(2,4) *c(1,3,5,7,9,10) 

factorial(1:5) # 1,2,3,4,5
exp(2) #2.718 지수
#R의 기본 데이터 타입 : 벡터
exp(2:10) #2,3,4,5,6,7,8,9,10 (끝이 포함이된다 파이선에서는 포함안됨)
cos( c(0, pi/4)) # 180 0~2pi : 3.141592 

sqrt(c(1,4,9,16))

sum(c(1,2,3,4)) 
sum(c(1,2,NA,3)) #NA: 결측치  R은 대소문자 구분함
1/0 # 무한대

0/0 # NaN
Inf / NaN
Inf / Inf
log(Inf)
Inf + NA
#숫자인 Inf,NaN,NA
vec <- c(0,Inf,NaN,NA)
typeof(vec)
mode(vec)
class(vec)
is.finite(vec) # check
is.nan(vec)
is.na(vec)
is.infinite(vec)
sum(vec)

# 연산자 정의
# 데이터 타입을 지정하지 않기 때문에 함수의 리턴타입이 없음
# R의 함수는 1급 함수수
`%divisible%` <- function(x,y)
{
  if(x%%y == 0) return(TRUE) #나누어 떨어지면면
  else          return(FALSE)
}
10 %divisible% 3
10 %divisible% 2
`%divisible%`(10,5)


# 벡터 연산
x<-c(5,6,7)
y<-c(1,2,3)
x%%y #나머지 연산자
x%*%y # 벡터의 내적 #벡터에서는 내적, 행렬에서 행렬곱
# 내적은 두 벡터의 요소끼리 곱한다음 다 더해준 결과값
# 내적의 결과값의 의미는 한 벡터의 크기* 한벡터의 크기 * cos(theta)의 의미가 있다 

sum(x*y) 
x%/%y #몫 연산자

#R에서 사용하는 상수
LETTERS
letters # 소문자 알파벳
month.name
month.abb #약어
pi
class(month.name)

#vector : 열중심 
# 열중심으로 하는 이유 :  검색이 중요하지 않고 통계량이 중요
# 합계, 평균, 분산, 표준편차, 표준오차차

a <- c('apple','orange','banana')
mode(a)
class(a)
length(a)
NROW(a) #행 ROW
NCOL(a) #열 COL

#배열의 인덱스가 1부터 시작 (추가가 가능함)
x<-c(1,5.4, TRUE,"hello")
x

x[5] = 123
x

x[200] = 100
x
 
x<- c(1,5.4 , TRUE) # boolean보다 숫자가 더 큰 범위위
x

(x=vector("list",10)) # [[3]]
(x=vector("numeric",10))
x
rm(x) # 메모리에서 변수 삭제(공간 확보가 중요)
x

#연속적 숫자표현
(x<- 1:7) #범위는 정수만 가능능
(y<- 2:-2)

seq(1, 3.2, by=0.2)# sequence
seq(1, 5, length.out = 4)
seq(1, 6, length.out = 4)

(b<- rep(1:4,2)) #repeatation
(d<- rep(1:3,each=3))
(d<- rep(1:3,2,each=3)) # each가 먼저 적용된다

# indexing
x<-c(1:9)
x 
x[3]
x[c(2,4)]
x[-1] # 제외하고의 의미

x[c(2,-4)] # 음수 양수 인덱스는 동시에 사용 불가함
x[c(2.4, 3.54)] # 절사 인덱스를 사용
# 1 2 3 4 5 6 7 8 9
# R에서는 연산의 개수가 일치해야함( 부족하면 recycling )
x[c(TRUE,FALSE,FALSE,TRUE)] # boolean indexing
x[x<3]
x[x>3]
x<3

#vector에 행이름을 부여
(x <- c("first"=3, "second"=0, "third"=9))
x
x["second"]
x[c("first","third")]

x = c(-3, -2, -1, 0, 1, 2)
#rx(x[1])
#x[1]=NULL
x

# 문제 : 
# x에 1,2,3을 대입하고 y에 2,3,-4 를 대입한 다음
#사칙연산 해보시오

(x<-c(1,2,3))
(y<-c(2,3,-4))
x+y
x-y
x*y
x/y

x%*%y #내적

x<- 1:5
all(x>2)
any(x>2)

# 데이터 정렬
x<- c(3,2,6,4,5,8,1)
x

#매개변수가 상이해도 작동하는 이유
#R은 객체지향 프로그래밍 
#함수는 디폴트 매개변수를 가짐
sort(x) # 내림차순, 오름차순
sort(x, decreasing=FALSE)
sort(x, decreasing=TRUE) # 내림차순, 


#order는 왜 있을까 : 데이터가 2개일때 다른 열을 중심하고 정렬하고 싶을때 
order(x) # 인덱스 순서
order(x,decreasing = TRUE)
x[order(x)]

# NA 연산
x = c(2, NA, 3, 1, 4)
sum(x)
sum(x, na.rm=TRUE) #remove
mean(x, na.rm = TRUE) # 평균
median(x, na.rm=TRUE) # 중위수 : 통계학에서는 중위수가 더 중요 / 정렬후 중간값을 대표값으로 
#이상치 때문에 
prod(x, na.rm=TRUE) #product

# 행이름을 부여
# 주의할 점 : 원본을 변화시키는 함수가 있고 아닌 함수가 있으며 구분해야함함
vectorA <- c(1,2,3,4)
names(vectorA) <- c("국어","영어","수학","과학")
vectorA
vectorA["국어"]
vectorA[2]
vectorA[-1]
vectorA[c(1,3)]
vectorA[vectorA > 5]
vectorA[c(FALSE,FALSE,TRUE)]
append(vectorA, c(3,4,5))# 데이터 추가도 가능
vectorA
(vectorB= append(vectorA,c(3,4,5))) # 대입을 해주어야 변화됨
vectorB
#CRUD
#-vector
#-c, 공간확보를 위해 (vector)
#-인덱스([],vector 인덱스, 음수 인덱스, boolean indexing(if)  )
#-update : index 인덱스로 값을주면 수정됨
#-삭제 : 한개 값 삭제 불가능(NA)
#변수 삭제 : rm(변수)

#집합연산 
x # 2 NA 3  1  4
y # 2 1  0 -1 -2
union(x,y) # 합집합 : 중복은 1개로 출력
intersect(x,y) # 교집합
setdiff(x,y)# 차집합
setdiff(y,x)
setequal(x,y)

# sort, order(정렬한 인덱스)
# subset
(x<- c(3,2,6,4,5,8,1))
subset(x, x>3)
which(x*x > 8) #위치가 어떤것인가? (인덱스로 나옴)

#sample 선택
#복원추출
#prob : probability 확률
(x <- c(sort(sample(1:3,3, replace=T,prob = c(0.5, 0.3, 0.2)))))

#
nums<- c(5,8,10,NA,3 ,11)
nums
which.min(nums) # 제일 작은 데이터가 있는 인덱스 위치
which.max(nums) # 제일 큰 데이터가 있는 인덱스 위치
nums[which.min(nums)] 
nums[which.max(nums)]

# 문제 
#01 벡터 객체 생성
#1 vector1 변수 만들고 R 문자가 5회 반복하도록 하시오
(vector1 <- rep('R',5))
vector1
#2 vector2 변수에 1~20까지 3간격으로 연속된 정수
(vector2 <- seq(1, 20, by=3))
vector2
#3 vector3 1~10까지 3 간격으로 연속된 정수 3회 반복
(vector3 <- rep(seq(1, 10, by=3),3) )
vector3
#4 vector4 vector2~3 모두 포함되는 벡터
(vec4 <- append(vector2,vector3) ) #union 쓰면 중복이 제고ㅓ됨됨
vec4
#5 25~ -15까지 5간격으로 벡터 생성 ~ seq()함수 이용
x <- seq(25, -15, by = -5)

# 결과 출력
print(x)
#6 vec4에서 홀수번째 값 선택 vec5에 할당 (첨자 이용)
vec5 <- vec4[seq(1, length(vec4),  2)]
vec5
(vec5 <- vec4[seq(1, length(vec4))%%2 == 1])
vec5

# 홀수 번째 값 선택하여 vec5에 할당
vec5 <- vec4[seq(1,length(vec4),by=2)]

# 결과 출력
print(vec5)

#install.packages("NISTunits",dependencies = TRUE) # 종속패키지 함께 설치 
#제거는 remove.pakages("NISTunits")

library(NISTunits)
NISTdegTOradian(180) #3.141592 컴퓨터 각도는 라디안을 사용
NISTradianTOdeg(pi)
ang<-45
(a<-NISTdegTOradian(ang))
(b<- NISTradianTOdeg(a))

(ratio=sin(a) )#길이의 비 대각선하고 수직선하고의 비
#만약 대각선이 10이라면 수직선은 얼마인가
(result = 10 * ratio)
#길이의 비를 라디안으로 변환
(ang_rad = asin(ratio))
NISTradianTOdeg(ang_rad)

# 문제 : 각도가 30도 이고 대각선의 길이가 5일때 수직하는 변의 길이는 얼마인가?


ang<-30
(a<-NISTdegTOradian(ang))
(b<- NISTradianTOdeg(a))
(ratio=sin(a) )
(result = 5* ratio) 

radian30 = NISTdegTOradian(30)
ratio = sin(radian30 )
5*ratio 
# 문제: 각도가 30도이고 대각선의 길이가 5일때 밑변의 길이는?
ang<-30
(a<-NISTdegTOradian(ang))
(b<- NISTradianTOdeg(a))
(ratio=cos(a) )
(result = 5* ratio) 

radian30 = NISTdegTOradian(30)
ratio = cos(radian30 )
5*ratio 
# 직각을 이루는 두변의 길이가 밑변 높이가 5 각도는 얼마?
ratio = 5/10
# 길이의 비를 각도로 변경하는 함수 atan
result = atan(ratio)
NISTradianTOdeg(result)

# 두 벡터의 사이각은 내적을 이용
x <- c(1,2,3)
y <- c(2,3,-4)
sum(x*y) # 내적값이 -4

dotresult = x%*%y
# |A| |B| cos theta
(xnorm = sqrt (1^2+2^2+3^2))
(ynorm = sqrt (2^2+3^2+(-4)^2))

costheta = dotresult / (xnorm*ynorm)
radianangle = acos(costheta)
NISTradianTOdeg(radianangle)

x<-c(1,0,0)
y<-c(0,1,0) #의 사이각을 구해보시오
sum(x*y)


dotresult = x%*%y
(xnorm = sqrt (1^2+0^2+0^2))
(ynorm = sqrt (0^2+1^2+0^2))

costheta = dotresult / (xnorm*ynorm)
radianangle = acos(costheta)
NISTradianTOdeg(radianangle)

#문제  43.04666
a<-c(1,2,4,1,2,4,3,6,7,2,0)
b<-c(1,3,2,3,2,2,1,2,1,1,1)

#의 사이각을 구해보시오오

 
sum(a*b)


dotresult = a%*%b
(xnorm = sqrt (1^2+2^2+4^2+1^2+2^2+4^2+3^2+6^2+7^2+2^2+0^2))
(ynorm = sqrt (1^2+3^2+2^2+3^2+2^2+2^2+1^2+2^2+1^2+1^2+1^2))

(costheta = dotresult / (xnorm*ynorm))
(radianangle = acos(costheta))
NISTradianTOdeg(radianangle)