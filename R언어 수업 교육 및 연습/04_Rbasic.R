
#install.packages("tidyverse")
#library(tidyverse)
#library(dplyr)
# modern한 문법을 적용하기 위해서 데이터 타입입을 tibble 형으로 변환
df<- as_tibble(mtcars)  #as. 데이터프레임 -> tibble 형으로 변환
df
str(df)
class(df)
head(df)

# 테이블 형태, 사각형에 정의된 데이터
starwars # 영화출연자 정보
head(starwars)
class(starwars)  # "tbl"
glimpse(starwars)  # =str(열에 대한 설명) /glimpse(열 정보)

starwars %>%
  filter(species == "Droid")
?filter  # 행 선택, =subset

starwars %>%
  select(name, ends_with("color"))  # ends_with = 정규표현식 함수 # 열을 선택

starwars %>%
  mutate(name, bmi = mass / ((height / 100) ^ 2 )) %>%      # mutate 는 변수를 추가
  select(name:mass, bmi)  # name 부터 mass 까지 출력하고 bmi 추가

starwars %>%
  arrange(desc(mass))     # 정렬(기본: 오름차순)

# 1단계 데이터 분석 : 데이터 요약
starwars %>%       # 생략에 익숙해시면 추상화가 쉬워진다! 
  group_by(species) %>%    # 결과 그룹바이한 변수와 집계함수만 나타남
  summarise(       # 데이터 요약
    n = n(),       # 갯수 카운트
    mass=mean(mass, na.rm=TRUE)  #null값과 na값은 제외하기 위해 씀
  ) %>%
  filter(
    n>1,
    mass>50
  )
# 집계의 기준이 되는 species 

data <- data.frame(x1 = 1:6,
                   x2 = c(1, 2, 2, 4, 1, 2),
                   x3 = c("F", "B", "c", "E", "A", "D"))
data
# x1, x2 변수만 선택해 보시오
select(data, x1, x2)
# x1 변수만 제외하고 출력
select(data, -x1)
# x3를 중심하고 정렬해보시오
arrange(data,x3)
# x2 가 2인 데이터만 출력 해보시오
filter(data, x2==2)
# x1과 x2를 더해서 x4변수를 만드시오
data<-mutate(data,x4 = x1+x2)
# x4 변수를 100으로 나누어서  x5 변수를 만드시오
mutate(data, x5= x4/100,
       x6=x4* x2)
# x4 와 x2를 곱해서 x6 변수를 만드시오
grouped_data = group_by(data, x2)
summarise(grouped_data,
          average_height = mean(x1),
          people=n())

data %>%
  group_by( x2) %>%
  summarise(
    average_height = mean(x1),
    people=n())

?mpg
str(mpg)
distinct(mpg, class)  # 범주를 알아보는 명령어
best_in_class <- mpg %>%
  group_by(class) %>%
  filter(row_number(desc(hwy)) == 1)  # 데이터에 행번호를 지정
best_in_class

test<-mpg
test %<>% # 입력과 출력 데이터표현 , 들어가서 처리되서 마지막 값을 다시 넣는다
  group_by(class) %>%
  filter(row_number(desc(hwy)) == 1)  # 행번호 결정하고 1번인 것들
test2<-mpg

# displ 의 중위수와 hwy 고속도로 연비의 중위수를 구해보시오
class_avg<- test2 %>%
  group_by(class) %>%
  summarise( # 정보로 요약
    displ = median(displ),
    hwy = median(hwy)
  )
class_avg

mpg %>%   # displ(배기량)
  filter(displ >= 5 , displ <= 7 , hwy >=10 , hwy <=30) %>%
  ggplot(aes(displ,hwy))+   #ggplot(데이터, 미적요소(x,y 좌표)): 레이어  
  geom_point(aes(color=class))+  # 클래스별로 컬러 변경
  geom_smooth()  # 비선형회귀로 그래프를 그려라
# 비선형회귀선(데이터와 가장 가깝게)

# 선형회귀선 : 직선으로 모든데이터를 예측하는 y=ax+b , 기울기(a)와 절편(선b,편차)을 구하는 것
# 예측과 실제값의 차이를 가장 적게하는 직선의 방정식을 구하는식 (상계가 벌어짐)
# 차의 제곱의 합을 구해서 가장 적게하는 직선의 방정식: 예측을 하려고 구함
# 최소제곱법:제곱한 값의 합을 최소로 하는 기울기와 절편 
# 최소제곱후 다 합한값이 가장 작아지는 선을 구한것이 선형회
# 비선형은 과적합(특정 특이값 때문에) -> 선형(일반화된 결과값)
# 딥러닝이 비선형회귀
# 점추정하면 틀릴 확율이 높아짐 , 그래서 구간추정
# 구간추정:표준오차로 구함
# 95% 구간추정   평균 +- 표준오차*2

#install.packages("tidyvers")
#install.packages("hflights")
library(tidyverse)
library(hflights)
?hflights
# 휴스톤 공항 출발 도착정보
head(hflights)
dim(hflights)
library(data.table)   
# data.frame을사용 ->data.table 은 db처럼 key를 가지고 있음(데이터정렬/데이터 처리시 속도가 더 빠름)
library(dtplyr)
hflights_df <- as_tibble(hflights)
arrange(hflights_df,Month, DayofMonth, desc(AirTime))
data<-mutate(hflights_df, gain=ArrDelay - DepDelay , gain_per_hour=gain/(AirTime/60))
data
head(data$gain)
dest_planes_flights <- hflights_df %>%
  group_by( Dest)  %>%
  summarise(planes= n_distinct(TailNum),flights=n())    # 비행기 수, n=비행횟수
# 연, 월, 일 로 그룹핑해서 비행횟수 출력
hflights_df %>%
  group_by(Year, Month, DayofMonth) %>%
  summarize( number_flights=n()) %>% # 비행횟수
  summarize( number_flights = sum(number_flights)) # 집계(전체 비행 횟수)

# 문제
# 1: Year, Month, DayofMonth 로 순서대로 그룹화
# 2: Year, DayofMonth, ArrDelay, DepDelay 열을 선택
# 3: 평균 연착시간과 평균 출발 지연시간을 구함
# 4: 평균 연착시간과 평균 출발지연시간이 30분 이상인 데이터를 추출하시오
hflights_df %>% group_by(Year, Month, DayofMonth) %>%
  select(Year:DayofMonth, ArrDelay, DepDelay) %>%
  summarise(arr = mean(ArrDelay, na.rm = TRUE), dep = mean(DepDelay, na.rm = TRUE)) %>%
  filter(arr > 30 | dep > 30)

# 몇 년간의 데이터인가
unique(hflights_df$Year)  #2011
n_distinct(hflights_df$Year)  
# 몇개 항공사(Flightnum)의 몇개 비행기(Tailnum) 인가
unique(hflights_df$FlightNum)
n_distinct(hflights_df$FlightNum)  # 3740 FlightNum(항공사넘버)
unique(hflights_df$TailNum) #TailNum(비행기 고유번호)
n_distinct(hflights_df$TailNum)  

# 평균 비행시간을 구해주세요(AirTime)
summarise(hflights_df, Arr=mean(ArrTime, na.rm=TRUE))
mutate(hflights_df, cnt = n(), sum= sum(AirTime, na.rm=T), avg=sum/cnt)  

# 문제 : 다음 데이터를 데이터프레임으로 생성하시오
# empno pay bonus
# 101   250   0.10
# 102   180   0.10
# 103   200   0.12
# 104   300   0.15
# 104   300   0.15
# 105   1000  0.00
# pay201801 <-

(pay201801<-data.frame("empno"=c(101,102,103,104,105), "pay"=c(250,180,200,300,1000) , "bonus"=c(0.10,0.10,0.12,0.15,0.00)))
# 문제2: total 컬럼을 추가해 급여 + 급여*보너스
pay201801<-mutate(pay201801, total=pay+(pay*bonus))
# 문제3: dplyr 을 이용해 총급여 300이상인 사원번호화 총급여를 출력하시오
pay201801 %>%
  filter(total>=300) %>%
  select(empno, total) 

# 문제4: 다음의 출력처럼 부서번호(depno) 를 추가하시오
# empno  pay   bonus  depno
# 101    250   0.10    1
# 102    180   0.10    2
# 103    200   0.12    1
# 104    300   0.15    2
# 105    1000    0.00    2
deptno<-c(1,2,1,2,2)
pay201801<-cbind(pay201801,deptno)

pay201801$deptno= deptno

pay201801
# 문제5: 아래의 출력 내용처럼 부서별 급여 평균을 출력하시오
# depno   mean_Total
#   1       250 
#   2       514
pay201801 %>%
  group_by(deptno) %>%
  summarise(mean_total=mean(total)) %>%
  select(deptno, mean_total)

pay201801 %>%
  group_by(deptno) %>%
  dplyr::summarise(mean_total=mean(total), sum_total=sum(total))

# formula  ~ 을 이용해서 종속변수와 독립변수를 묶는 식으로 표현
aggregate(total ~ deptno, data = pay201801, sum)  # 합계로 집계해라!
aggregate(total ~ deptno, data = pay201801, mean)

tapply( pay201801$pay, pay201801$deptno, mean)
# 문제6: x축을 empno, y축을 pay로 해서 geom_bar 형태로 그래프를 그려보시오
#geom_bar(돗수)- 범주형데이터를 카운트 할 때 사용,geom_histogram(구간범주화 후에 돗수),geom_col(x,y를 지정해서 출력))
#install.packages("ggplot2")
library(ggplot2)
ggplot(pay201801, aes(empno, pay,fill="empno")) + geom_col()
ggplot(pay201801, aes(deptno))+geom_bar()    # x축만 주면 되는 것 /카운트 같은 것들을 사용
ggplot(pay201801, aes(pay))+geom_histogram(bins=30)


############# 데이터 베이스 처리 #############    
library(data.table)
library(RMySQL)  
#install.packages("RMySQL")

con<-dbConnect(MySQL(), user="root", password="2030", dbname="mirae", host="localhost", port=3306)
dbListTables(con)    

data(iris)
IRIS<-data.table(iris)
dbWriteTable(con,"IRIS",IRIS,overwrite=TRUE)
(IRIS=dbReadTable(con,"IRIS"))
class(IRIS)
IRIS<-data.table(IRIS)   # key 부여 가능 (정렬)/ 관리속도가 빠르다

setkey(IRIS, Species)
tables()  # data.frame 으로 구성된 데이터가 몇개인가
IRIS[J("setosa"),]
IRIS[,sum(Sepal.Width),by="Species"]  # 종별로 그룹핑한 Sepal.w  의 합계

#install.packages("PASWR")
library(PASWR)
data("titanic3")
titanic<-titanic3
class(titanic)
str(titanic)
?titanic3  #1309x14

# titanic.dt<- data.table(data)
# str(titanic.dt)
# head(titanic.dt)

# setkey(titanic.dt$pclass)
# tables()
titanic[pclass==1,]

titanic3
str(titanic3)  # 이름도 factor형으로 지정되어있음

dbWriteTable(con, "mtcars", mtcars)
dbListTables(con)
str(mtcars)
?mtcars
res<-dbSendQuery(con, "SELECT*FROM mtcars WHERE am = 0") # 수동기어0
# resultset:데이터베이스에 쿼리를 하면 => 클래스
dbFetch(res)
dbClearResult(res) # 가져오면 지우기

#문제: 실린더가 4개 또는 6개인 데이터를 쿼리하시오
res2<-dbSendQuery(con,"SELECT * FROM mtcars WHERE cyl= 4 or cyl = 6")
dbFetch(res2)
dbClearResult(res2)

library(PASWR)
data("titanic3")
(titanic <- titanic3[, !names(titanic3) %in% c("home.dest", "boat", "body")] )
str(titanic)
head(titanic)
# View(titanic)

# titanic$pclass <- as.factor(titanic$pclass)
titanic$name <- as.character(titanic$name)
titanic$ticket <- as.character(titanic$ticket)
titanic$cabin <- as.character(titanic$cabin)

# titanic$survived <- factor(titanic$survived, levels=c(0, 1), labels=c("dead", "survived"))
# titanic$pclass <- factor(titanic$pclass, levels=c("1","2","3"), labels=c("1st", "2nd", "3th"))

dbWriteTable(con, "titanic", titanic, overwrite=T)
?dbWriteTable
myData<-con %>%
  tbl("titanic") %>%
  select(pclass, sex, age, fare, survived, parch) %>%
  filter(survived==0)
myData
# 원시데이터 - 데이터베이스에 있음 (메모리를 효율적으로 활용가능)
myData <-dbReadTable(con, "titanic") %>%
  select(pclass, sex, age, fare, survived, parch) %>%
  filter(survived==0)

#  
# 문제 : titanic 테이블에서 선실별 남여로 그룹핑하고 survived 의 평균을 출력
myData<- titanic %>%
  select(pclass, sex ,survived) %>%
  group_by(pclass, sex) %>%
  summarise(survival_ratio = mean(survived, rm.na=T)) 
myData
# layer
ggplot(myData, aes(pclass, survival_ratio, color=sex, group=sex))+
  geom_point(size=3) + geom_line()

xtabs(~ sex+ pclass, data=titanic)  # 교차표

# 문제 mtcars 데이터 프레임 mysql에 저장하고 다음질문에 대답하시오
dbListTables(con)
dbListFields(con,"mtcars")
dbReadTable(con,"mtcars")

# 1. 자동변속기인 자동차 중에 mpg, cyl, am을 쿼리하시오(am==0)

mtt<-dbSendQuery(con, "SELECT mpg,cyl,am FROM mtcars WHERE am = 0")  
mtcar_db<-dbFetch(mtt)
dbClearResult(mtt) 
mtcar_db

mtcars %>%
 filter(am == 0) %>%
 select(mpg,cyl,am)
# 2. 연비(mpg)가 20보다 큰 자동차를 선택하고 mpg,cyl,am을 출력
mtt<-dbSendQuery(con, "SELECT mpg,cyl,am FROM mtcars WHERE mpg > 20")  
mtt_mpg<-dbFetch(mtt)
dbClearResult(mtt) 
mtt_mpg


# 3. 실린더가 4 또는 6개인 자동차들 중 mpg, cyl , am 을 출력
mtt<-dbSendQuery(con, "SELECT mpg,cyl,am FROM mtcars WHERE cyl= 4 or cyl= 6")  
mtt_cyl<-dbFetch(mtt)
dbClearResult(mtt) 
mtt_cyl 

# 작업이 끝나면 mtcars 테이블을 삭제하시오 (dbRemoveTable)
dbWriteTable(con, "trial", res_cyl)
dbRemoveTable(con,"trial")
dbDisconnect(con) # DB 연결종료 : DB, file, network는 os에서 관리하기 떄문에 
#반드시 종료해야하는데 : DB를 연결하고 종료하지 않으면 나중에 연결
#자원이 부족하게 되어서 연결이 안됨


# dbDisconnect(con)  # DB 연결종료


