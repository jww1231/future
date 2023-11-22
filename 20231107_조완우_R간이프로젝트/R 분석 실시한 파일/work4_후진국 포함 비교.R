library(dplyr)
library(party)  
library(rpart) 
library(randomForest) 
library(caret) 

# 연도별 탄소증감률
co2<-read.csv('CO2-2.csv')
# 연도별 경제성장률
growth<-read.csv('GRO.csv')

str(co2)
head(co2)
str(growth)
head(growth)
co2data <- co2[, c(2:5)]
co2data
gro <- growth[, c(1:4)]
gro
colnames(co2data) <- c("Country", "co2_2018", "co2_2019","co2_2020")
colnames(gro) <- c("Country", "gro_2018", "gro_2019","gro_2020")
head(co2)
head(gro)

merged_data <- merge(co2data, gro, by="Country" , all=FALSE)
str(merged_data)

# gro_2019 열의 데이터 타입을 실수형으로 변환합니다.
merged_data$gro_2019 <- as.numeric(as.character(merged_data$gro_2019))
merged_data$gro_2020 <- as.numeric(as.character(merged_data$gro_2020))
 
# CO2 열들에 대해 각각 정규화를 수행합니다.
merged_data$co2_2018 <- (merged_data$co2_2018 / sum(merged_data$co2_2018)) * 100
merged_data$co2_2019 <- (merged_data$co2_2019 / sum(merged_data$co2_2019)) * 100
merged_data$co2_2020 <- (merged_data$co2_2020 / sum(merged_data$co2_2020)) * 100



# 데이터 타입 변환 후 다시 시도합니다.
long_data <- pivot_longer(
  merged_data,
  cols = c(co2_2018, co2_2019, co2_2020, gro_2018, gro_2019, gro_2020),
  names_to = c(".value", "year"),
  names_sep = "_"
)

long_data # 357 × 4

# co2와 growth의 상관관계를 계산하되, NA 값을 무시합니다.
corre  <- cor(long_data$co2, long_data$gro, use = "complete.obs")
# 결과를 출력합니다.
print(corre) #  0.2209606
# 선형 회귀분석을 실행합니다.
lm_model <- lm(gro ~ co2 , data=long_data)
# 요약 결과를 출력합니다.
summary(lm_model) #Adjusted R-squared:  0.04002   p-value: 0.02036
# ggplot2 패키지를 불러옵니다.
library(ggplot2)
# ggplot을 사용하여 산점도와 선형 회귀선을 그립니다.
ggplot(long_data, aes(x = co2, y = gro)) +
  geom_point() +  # 산점도
  geom_smooth(method = "lm", col = "blue") +  # 선형 회귀선
  labs(title = "CO2 vs Growth", x = "CO2 Emissions", y = "Economic Growth")


 