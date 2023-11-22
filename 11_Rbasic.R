#Machine learning
#연관분석 : Rule base model
# lhs-rhs 의 경우의 수를 카운트
# 지지도(support), 신뢰도(confidence), 향상도(lift) 척도를 기준으로 관계의 중요성을 추출
# apriori 패키지 : 연관분석 모델

# original data -> transaction matric -> apriori모델 -> inspect확인
library(arules)
data("Adult")
DATAFRAME(head(Adult))
str(Adult)    # s4 class로 작성 @ 클래스 구성방식중 하나인 S4로 만들어져있음
typeof(Adult) # transaction matrix 형태 
rules <- apriori(Adult) # [6137 rule(s)] 규칙이 6137개 발생함 ## apriori가 룰셋을 만들어준다
rules.sub <- subset(rules, # subset을 통해서 조건 맞는걸 추출함함
                    subset =rhs %in% "marital-status=Never-married" & lift >2)
rules.sub # set of 58 rules 
inspect(rules.sub) # 트렌젝션 매트릭스는 인스펙트 함수를 통해 내부값을 볼수 있다다
# age : 구간 범주화 원핫인코딩해서 -> 하나의 dummy 변수화함
# 범주형 -> dummy 변수화 , 연속형 -> 구간범주화
# 4개는 연속된 수치 그대로쓰면 너무 많은 범주가 나옴
# 도수 분포표 : 같은 데이터의 갯수를 세는것
# 
dim(iris)
data(iris) # 150 x 5 => 4 * 3 + 3 => 15개
head(iris)
irisDisc <- discretizeDF(iris) #discretizeDF 해당 함수는 자동으로 구간 범주화 함수 , 한열의 데이터를 break3개로 구간범주화함
head(irisDisc)
trans5 <- as(irisDisc,"transactions") # 15 items :4 * 3 + 3 => 15개
trans5
inspect(head(trans5))
rules <- apriori(trans5)
rules <- apriori(trans5,parameter = list(supp=0.01,conf=0.01)) #[859 rule(s)]
rules <- apriori(trans5,parameter = list(supp=0.3,conf=0.01))  #[34 rule(s)]
rules <- apriori(trans5,parameter = list(supp=0.3,conf=0.9))   #[18 rule(s)]
inspect(rules)
################################ 라면, 맥주, 우유, 과일, 고기
# t1 : 라면,맥주,우유
# t2 : 라면,고기,우유
# t3 : 라면,과일,고기
# t4 : 고기,맥주,우유
# t5 : 라면,고기,우유
# t6 : 과일,우유

a<-c(1,1,1,0,0)
b<-c(1,0,1,0,1)
c<-c(1,0,0,1,1)
d<-c(0,1,1,1,0)
e<-c(1,0,1,0,1)
f<-c(0,0,1,1,0)
(df<- data.frame(a,b,c,d,e,f))
(df<-t(df)) # t 전치 행렬의 결과는 matrix
colnames(df)<- c('라면', '맥주', '우유', '과일', '고기')
df
trans4 <- as(df, "transactions")
rule<- apriori(trans4,parameter = list(supp=0.01, conf=0.01)) # 35 rules
inspect(rule)
# t1 : 라면,맥주,우유
# t2 : 라면,고기,우유
# t3 : 라면,과일,고기
# t4 : 고기,맥주,우유
# t5 : 라면,고기,우유
# t6 : 과일,우유
#     lhs             rhs    support confidence coverage  lift  count
#  {라면, 고기} => {과일} 0.1666667 0.3333333  0.5000000 0.6666667 1
#       3             2
#   공통은 1번                1/6       1/3             (1/3)/ (2/6)
#   {라면}       => {우유} 0.5000000 0.7500000  0.6666667 0.900   3    
#   라면4번        우유 5번  
#   라면과 우유 3번          sup:3/6      conf:3/4      lift :(3/4) / (5/6)-> 18/20 ->9/10->0.9

# 문제:  데이터베이스에 데이터를 저장하고
# 데이터를 가지고 온다음 연관분석을 해보시오 (DB에 데이터를 분석하는 경우)


#install.packages("RMySQL")
library(RMySQL)


con <- dbConnect(MySQL(), user='root', password='2030', 
                 dbname='order', host='127.0.0.1',port=3306)

df <- as.data.frame(df)
dbIsValid(con)

dbWriteTable(con, "trans4", df)

trans5<- apriori(trans4,parameter = list(supp=0.01, conf=0.01)) # 35 rules
inspect(trans5)

dbDisconnect(con)
######################선생님 정답######################
library(dplyr)
library(dbplyr)
library(DBI)
conn <- DBI::dbConnect(RMySQL::MySQL(),
                       dbname="Association",
                       host = "127.0.0.1",
                       user = "root",
                       password= "2030")
dbListTables(conn)
dbWriteTable(conn, "tr_table", value =df, append = F,
             overwrite = T)
?dbWriteTable

dbIsValid(conn)

res <- dbSendQuery(conn, "SELECT * FROM tr_table")
(df<-dbFetch(res))
(df<-df[ ,2:length(df)]) #행이름 제거
df
df_tran <- as(df, "transactions")
rule <- apriori(df_tran, parameter = list(supp=0.6,
                          conf=0.3, minlen = 2, maxlen=3))
inspect(rule)
#install.packages("arulesViz")
library(arulesViz)
plot(rule, method="graph")

data("Groceries")
str(Groceries) #s4 class $->@
Groceries # 9835거래 169 items
summary(Groceries)
inspect(head(Groceries, 3)) # 거래 내역 확인
size(head(Groceries))
LIST(head(Groceries,3))
itemFrequencyPlot(Groceries,topN =15)
gdf <- as(Groceries, 'data.frame')
head(gdf)
# 4품목 이상의 장을 본경우 확인
inspect(subset(Groceries[1:200], size(Groceries[1:200])>4))
wholemilk_rules <- apriori(data = Groceries,
    parameter = list (supp= 0.001, conf = 0.08, minlen=2), # minlen은 최소 비교할 값의 숫자를 줄여줌 
    appearance = list (lhs="whole milk"))
inspect(wholemilk_rules)
rules <- apriori(Groceries, parameter = list(support=0.001, confidence = 0.5))
rules                 
rules_conf<- sort(rules, by = "confidence", decreasing = T)
inspect(head(rules_conf))
rules_lift <- sort(rules, by = "lift", decreasing = T)
inspect(head(rules_lift))
plot(rules[1:1500], method="graph", engine = 'interactive')

#whole milk와 자주 구매하는 상품을 검색
amilk <- subset(rules,lhs %in% 'whole milk')
amilk
inspect(amilk)
rules_conf <- sort (amilk, by = "confidence", decreasing = T)
inspect(rules_conf[1:5])

# 문제 : 'berries'와 같이 사는 물건중에 support가 높은 수 3개를 확인해보시오
aberries <- subset(rules,lhs %in% 'berries')
aberries
inspect(aberries)
rules_conf <- sort (aberries, by = "support", decreasing = T)
inspect(rules_conf[1:3]) # root vegetables,tropical fruit, butter

data("AdultUCI")
str(AdultUCI) # 48842 x 15 
?AdultUCI #Census Income Database 소득에 미치는 영향
# 수치데이터는 구간범주화 (경우의 수가 대량으로 발생)
basket_rules <- apriori(AdultUCI,
                 parameter = list(sup=0.08, conf=0.5, target = "rules"))
basket_rules #40548 rules 
min(AdultUCI["age"])
max(AdultUCI["age"])
count(unique(AdultUCI["age"])) #74
# factor와 ordered의 차이# ordered는 순서가 있는 데이터
# 순서가 없는건 factor
AdultUCI[["age"]]<- ordered(cut(AdultUCI[["age"]],c(15,25,45,65,100)),
                            labels=c("young", "middle", "senior", "old"))
AdultUCI
nrow(AdultUCI)
# 문제 hours-per-week 에 대해 유일값의 개수를 확인해보시오
min(AdultUCI["hours-per-week"])
max(AdultUCI["hours-per-week"])
count(unique(AdultUCI["hours-per-week"])) # 96
      #[[]] 이건 값 하나하나의 요소를 의미함
AdultUCI[["hours-per-week"]]<- ordered(cut(AdultUCI[["hours-per-week"]],c(0,25,40,60,168)),
                            labels=c("part-time", "full-time", "over-time", "workaholic"))
AdultUCI[["capital-gain"]]<- ordered(cut(AdultUCI[["capital-gain"]],
    c(-Inf, 0, median(AdultUCI[["capital-gain"]][AdultUCI[["capital-gain"]]>0]),Inf)),
    labels=c("None", "Low", "High"))
AdultUCI[["capital-loss"]]<- ordered(cut(AdultUCI[["capital-loss"]],
    c(-Inf, 0, median(AdultUCI[["capital-loss"]][AdultUCI[["capital-loss"]]>0]),Inf)),
    labels=c("None", "Low", "High"))
AdultUCI["fnlwgt"] <- NULL
AdultUCI["education-num"]<-NULL
str(AdultUCI)
Adult_new <- as(AdultUCI,"transactions")
basket_rules <- apriori(Adult_new, parameter = list(sup= 0.08,
                                                    conf= 0.5, target="rules"))
p<- inspectDT(basket_rules)
htmlwidgets::saveWidget(p, "arules_2.html", selfcontained = FALSE)
browseURL("arules_2.html")


itemLabels(rules)

# 문제1 :  가족관계 및 교육 수준의 소득과의 연관성을 확인하시오
trans <- as(AdultUCI, "transactions")
# 항목의 빈도 확인
item_freq <- itemFrequency(trans)

# 빈도를 내림차순으로 정렬하여 출력
sorted_item_freq <- sort(item_freq, decreasing = TRUE)
print(sorted_item_freq)

# 연관 규칙 생성
rules <-  apriori(trans, parameter = list(sup= 0.18,
                                              conf= 0.5, target="rules", maxlen = 15))
related_rules <- subset(rules, subset = rhs %in% "income=small" & 
                          (lhs %pin% "relationship=Husband" | lhs %pin% "education=HS-grad"))
(inspect(related_rules))  

#Support (지지도): 18.07%가 education=HS-grad와 income=small을 동시에 가짐
#Confidence (신뢰도): 55.9%
#Lift (향상도): 1.10482 # 1이상으로 양의 상관관계
#결론적으로, 고등학교 졸업한 배우자를 갖고있다면 소득이 적다

# 문제2 : 주당 일하는 시간과 소득과의 관계를 확인하시오
rules <-  apriori(trans, parameter = list(sup= 0.075,
                                          conf= 0.62, target="rules", maxlen = 15))
related_rules <- subset(rules, subset = rhs %in% "income=small" & 
                          (lhs %pin% "hours-per-week=part-time"))
(inspect(related_rules)) 
rules_conf<- sort(related_rules, by = "confidence", decreasing = T)
(inspect(related_rules)) 
#Support (지지도): 7.5%  
#Confidence (신뢰도): 62.3%
#Lift (향상도): 1.230996 # 1이상으로 양의 상관관계
#결론적으로, 파트타임으로 일을하면 소득이 적다

# 문제3 : 기타 위의 데이터로 부터 자기가 주장하고자하는 내용을 확인하고
# 의견을 제시하시오

# 1번 문제로 알 수있었던건 배우자가 고등학교까지만 졸업했다면 
# 소득이 적을 확률이 높다는것을 알 수 있었다 
# 따라서 
# 주장 : 배우자가 고등학교졸업자이면 소득이 적고 그 이상으로 
#        교육을 받았을경우 소득이 높다

# 2번 문제로 파트타임 일을 할 경우에 소득이 적음을 알 수 있었다
# 주장 : 주에 파트타임으로 잠깐 일하면 소득이 적고 주에 오래 일 할 수록 소득이 높다다

# 파일로 제출 ( 20231101_이름_연관분석)


