#행렬의 종류
#정방행렬(행과 열수가 일치) 비정방행렬
# 정방행렬이 되는 경우 : 공분산행렬, 상관계수 행렬, 거리행렬
# 대각행렬(대각으로 값을 가지고 있는 행렬 - 크기값을 결정) scaling matrix
# 대칭행렬 : 대각을 기준으로 상하의 값이 동일한 행렬
# 전치행렬 : 행과 열을 순서를 바꾼 행렬
# 행렬의 거듭제곱(3x5 %*% 3x5) 일때 전치 행렬로 가능하게
# 단위행렬 : 행렬의 행렬곱 연산의 항등원
# 역행렬 : 행렬은 나눗셈이 없음 -> 역행렬로 행렬곱을 하면 나누셈이 된다
# 직교 행렬: 행렬을 이루는 벡터간에 내적을 내면 0이 되는 행렬
# 내적 결과가 0이면 직교다
# 희소행렬 : 대다수의 데이터가 0인 행렬 -> 특징을 추출후 연산해야함
# 정방 행렬이면서 대칭행렬인 경우 전치행렬이 역행렬이다
# 정방행렬이면서 대칭행렬인 경우 고유값 분해를 하면 고유치와 고유벡터가 출력된는데
# 고유치는 벡터방향으로의 크기를 의미하고 고유벡터는 직교 벡터로 
# 이 직교 벡터로 데이터를 재표현하면 noise가 없는 데이터로 변환할 수 있다.
# 이를 주성분 분석이라고 한다.

# 행렬곱 연산
# 행렬곱은 내적의 연속이다.
# 내적은 다차원을 차원 축소해서 거리값과 방향을 고려한 하나의 값으로 
# 차원축소하여 표현하는 것
# 행렬곱은 이를 이용해서 행렬의 차원축소와 특징을 추출하는 용도로 사용된다

(a = matrix (1:12,nrow =3 , ncol =3 ,byrow=TRUE)) #행우선 배치
# 데이터가 부족하면 recycling됨
# 디폴트(default) 매개변수
matrix (1:9,nrow=3) #열이 주어지지 않으면 자동 계산됨 byrow=FALSE
class(a)
# vector->matrix->array
attributes(a) #dim = dimmension 차수 3x3
dim(a)

# 기본은 열우선배치( vector에서 행이름 names)
x= matrix(1:9, nrow=3 , byrow=TRUE)
colnames(x) #NULL
colnames(x)<- c("C1","C2","C3")
rownames(x)<- c("R1","R2","R3")
x

x("C1","R1")
x["R1"]

# 리스트 사용이유 : 행과 열수가 다를 수 있음음
(x<- matrix(1:9, nrow=3, dimnames = list(c("x","y","z"),c("A","B","C"))))

y<-matrix(nrow=2,ncol=2)#데이터 없이 공간확보보
y[1,2]
y[1,1]<-1 # 값 대입
y[2,1]<-2
y[1,2]<-3
y[2,2]<-4
y
mode(y)
class(y)

# matrix 결합
cbind(c(1,2,3),c(4,5,6))# column
rbind(c(1,2,3),c(4,5,6)) #row

#matrix는 모양을 유지함함
(x<- matrix(1:9, nrow=3 , byrow= TRUE)) #3x3
(y<- matrix(11:19, nrow=3 , byrow= TRUE)) #3x3
(c<- rbind(x,y))
(d<- cbind(x,y))

#indexing : matrix 는 반드시 행과 열로 인덱스가 지정되어야 함함
(x = matrix(1:9,nrow=3,byrow=TRUE))
x[c(1,2),c(2,3)]
x[c(2,3),]
x[,]
x[-1,] # 지정하지 않으면 전부다 출력력
(a=x[1,])
class(a)
mode(a)

(x = matrix(1:9,nrow=3,byrow=TRUE))
# 1,4,7,2,5,8,3,6,9 로 메모리에 기억되어 있음음
# 데이터가 메모리 저장될 때 열우선으로 기억됨됨
x[1:5] # 1차원 인덱스로 입력되면 매트릭스를 1차원으로 보고 출력함함
x[c(3,5,7)]

#boolean indexing
x[c(TRUE,FALSE,TRUE),c(TRUE,TRUE,FALSE)]
x[c(TRUE,FALSE),c(2,3)]
x[c(TRUE,FALSE)] # 1차원으로 보고 출력

x[x>5]
x[x%%2 == 0]

(x= matrix(1:9, nrow=3, ncol = 3))
(x[2,2] <- 10)
(x[x<5] <-0)
print(x)
t(x)
x
(xt=t(x))
x
# 3x3 3x3
x %*% xt # 행렬곱: 앞에 행렬의 열수와 뒤의 행렬의 행수가 일치
         # 행렬곱의 결과 : 앞의 행렬의 행수와 뒤의 행렬의 열수가 결정정
x %*% x 

(x= matrix(1:12, nrow =3 , ncol =4))
x*x # 요소 연산 : # 3x4 
t(x)
x %*% x # 3x4 3x4 #행렬 거듭제곱
x %*% t(x) # 3x4 4x3  -> 3x3
xt <- t(X)

(result = x%*%t(x))
# 문제 : 결과값의 result[1,1] 값을 결정하는 수식을 작성하시오
# 166이 어떻게 나왓는지 결정하는 수식 
x
t(x)
result[1,1]
xt<- t(x)
x[1,]
(x[1,]*xt[,1])
sum(x[1,] * xt[,1])
colSums(x[1,]*xt[,c(1,2,3)])
colSums(x[2,]*xt[,c(1,2,3)])
colSums(x[3,]*xt[,c(1,2,3)])


#R은 통계 분석 => 합계와 평균
#행합계 : data point 1인분 데이터
#열합계 : 속성 (국어 : 특성별 합계계)
(mdat <- matrix (seq(20,4,-2), nrow=3, ncol=3, byrow=TRUE,
                dimnames = list(c("a","b","c"),c("x","y","z"))))
nrow(mdat)
ncol(mdat)
dim(mdat)

rowMeans(mdat)
rowSums(mdat)
colMeans(mdat)
colSums(mdat)

#대각에 있는 요소만 추출
diag(mdat)
A<-diag(diag(mdat)) #diag에 벡터를 주면 행렬을 출력함 : 대각행렬 출력
A

# 고유값 분해(eigenvalue decompositio)
# 거듭제곱
(mdat2<- mdat%*%t(mdat)) # 거듭제곱의 특징 : 정방행렬이면서 대칭행렬이다 


# 고유벡터는 직교벡터
mdatEigen<-eigen(mdat2) # values(고유치), vectors(고유벡터)
(mode(eigen(mdat2)) )#list출력 
mdatEigen$vectors
mdatEigen$vectors[1,]
mdatEigen$vectors[2,]
mdatEigen$vectors[3,]

# 고유벡터는 직교벡터
#두벡터 내적이 0이되면 직교다다
mdatEigen$vectors[1,]%*%mdatEigen$vectors[2,] #  1.665335e-16
mdatEigen$vectors[1,]%*%mdatEigen$vectors[3,] #  0
mdatEigen$vectors[2,]%*%mdatEigen$vectors[3,] #  4.440892e-16

mdatEigen$vectors[,1]%*%mdatEigen$vectors[,2] #  -2.498002e-16
mdatEigen$vectors[,1]%*%mdatEigen$vectors[,3] #  2.220446e-16
mdatEigen$vectors[,3]%*%mdatEigen$vectors[,3] #  1

# 특이행렬분해 (singular value decomposition : SVD)
svd(mdat) # $d(차수: 행을 중심), $u(고유치와 같은의미), $v(차수가 열을중심심) 3개가 나옴

# y = 10x 에서 y 값이 20일때 x값은??
solve(20,10)
solve(10,20)

# 연립방정식의 해
# 2x +3y = 5    2,3  x  5
# 3x +5y = 6    3,5  y  6

(mdat<- matrix(c(2,3,3,5),nrow=2, ncol=2, byrow=TRUE))
(b=c(5,6))
solve (mdat,b) #7,-3 # mdat를 역행렬로 만들어서 c와 행렬곱을 하는게 solve의 역할


#문제
# 2x + y + z = 1
# 4x +3y +4z = 2
#-4x +2y +2z = -6

(mat<- matrix(c(2,1,1,4,3,4,-4,2,2),nrow=3, ncol=3, byrow=TRUE))
(b=c(1,2,-6))
solve (mdat,b)

# 문제 : 역행렬은 solve (mat)
# 역행렬을 구해서 행렬 곱으로 위의 연립방정식의 해를 구해보시오
(mdat<- matrix(c(2,1,1,4,3,4,-4,2,2),nrow=3, ncol=3, byrow=TRUE))
(b=c(1,2,-6))
solve (mat) 
t(mat)
(b*t(mat))

(inv_m <- solve(mat)) # 하나만 있으면 역행렬을 만들어줌
mat %*% inv_m # 단위 행렬

inv_m %*% b  # x = 1 y = -2 z =1 
# 검산


#영행렬 ( 행렬의 덧셈의 항등원 )
matrix (0,3,5) # 3X5
#원행렬
(one<-matrix(1,5,5))
(dia<-vec<-c(1,1,2,1,1)) #대각행렬:scale이 2배
(dia2<-diag(dia))
(one%*%dia2)
one*dia2

#MRS( rotate )
library(NISTunits)
vec <- c(1,1)
ang = NISTdegTOradian(180) # 주기성이 있는 데이터 
rot <- c(cos(ang), -sin(ang), sin(ang), cos(ang))
(mat = matrix(rot, nrow=2, ncol=2, byrow=T))

vec%*%mat

#문제 z축으로 회전시켜 보시오( 180 도 ) 
vec<-c(1,1,1)
ang = NISTdegTOradian(180) 
#   x요소   y요소  z요소
# cos(ang) -sin(ang) 0 #x축 
# sin(ang) cos(ang)  0 #y축
#    0       0       0 #z축 
rot <- c(cos(ang), -sin(ang),0 , sin(ang), cos(ang),0,0,0,0)
(mat = matrix(rot, nrow=3, ncol=3, byrow=T))

vec%*%mat

#문제 
#1부터 4까지의 수를 2x2행렬로 작성하고 (열우선 배치)
#5부터 8까지의 수를 2x2행렬로 작성한다음(행우선 배치)
#두 행렬의 요소연선(+-*/)를 시행하시오
#두 배열을 행과 열로 결합
# x 행렬에 대하여 행합, 열합, 행평균, 열평균을 구해보시오
# x행렬의 거듭제곱을 구하시오

(a = matrix(1:4, nrow=2, ncol=2, byrow=F))
(b = matrix(5:8, nrow=2, ncol=2, byrow=T))
a+b
a-b
a*b
a/b
a^b

cbind(a,b)# column #2X4
rbind(a,b) #row #4x2
x<- a

rowSums(x)
colSums(x)
rowMeans(x)
colMeans(x)

sum(1,2,3)
# sum주소를 전달하는 함수
apply(x,1,sum) # R은 함수형 프로그래밍을 지향(1: 행방향) rowSum보다 많이씀
apply(x,2,sum)
apply(x,1,mean)
apply(x,2,mean)
apply(x,1,max) # R은 함수형 프로그래밍을 지향(1: 행방향) rowSum보다 많이씀
apply(x,1,min)


xt<-t(x)
x %*% xt

