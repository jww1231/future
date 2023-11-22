library(dplyr)
library(party)  
library(rpart) 
library(randomForest) 
library(caret) 

co2<-read.csv('co2last.csv')
# 연도별 경제성장률
growth<-read.csv('growth.csv')

str(co2)
str(growth)

co2data <- co2[-c(1,2), c(1,4, 7, 10)]
head(co2data) #연도별 탄소증감률
str(co2data)
co2data$X2017.2 <- as.numeric(as.character(co2data$X2017.2))
co2data$X2018.2 <- as.numeric(as.character(co2data$X2018.2))
co2data$X2019.2 <- as.numeric(as.character(co2data$X2019.2))

colnames(co2data) <- c("Country", "co2_2017", "co2_2018","co2_2019")
colnames(growth) <- c("Country", "growth_2017", "growth_2018","growth_2019")

merged_data <- merge(co2data, growth, by="Country" , all=FALSE)
str(merged_data)

merged_data
 
# 필요한 패키지를 불러옵니다. 
library(tidyr)

# merged_data를 긴 형식으로 변환합니다.
long_data <- pivot_longer(
  merged_data,
  cols = c(co2_2017, co2_2018, co2_2019, growth_2017, growth_2018, growth_2019),
  names_to = c(".value", "year"),
  names_sep = "_"
)

# 결과를 확인합니다.
head(long_data)

long_data
 
write.csv(long_data, file="long_data.csv" , row.names = F)

# 정규화 전
# co2와 growth의 상관관계를 계산하되, NA 값을 무시합니다.
corre  <- cor(long_data$co2, long_data$growth, use = "complete.obs")
# 결과를 출력합니다.
print(corre) # 0.2209606 약한 양의 상관관계 확인됨
# 선형 회귀분석을 실행합니다.
lm_model <- lm(growth ~ co2, data=long_data)
# 요약 결과를 출력합니다.
summary(lm_model) #Adjusted R-squared:  0.04002   p-value: 0.02036

# ggplot2 패키지를 불러옵니다.
library(ggplot2)
# ggplot을 사용하여 산점도와 선형 회귀선을 그립니다.
ggplot(long_data, aes(x = co2, y = growth)) +
  geom_point() +  # 산점도
  geom_smooth(method = "lm", col = "blue") +  # 선형 회귀선
  labs(title = "CO2 vs Growth", x = "CO2 Emissions", y = "Economic Growth")
 

# 정규화 후
# Min-Max 정규화 함수
min_max <- function(x) {
  return ((x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE)))
}

# co2와 growth 열을 정규화합니다.
long_data$co2  <- min_max (long_data$co2)
long_data$growth  <- min_max (long_data$growth)

# 결과 확인
head(long_data)
 
# 필요한 라이브러리를 불러옵니다.
library(class)
library(dplyr)
#install.packages("kknn")
library(kknn)


# 결측치를 제거합니다.
long_data <- na.omit(long_data)

library(RMySQL)

con <- dbConnect(MySQL(), user='root', password='Dhksdn2030@', 
                 dbname='homework', host='34.64.89.3',port=3306, local_infile = TRUE)

library(data.table)
df <-  data.table(long_data)
dbIsValid(con)

dbWriteTable(con, "Defaultdata", df , append =T)

(data=dbReadTable(con, "Defaultdata"))

dbDisconnect(con)


library(ggplot2)

ggplot(long_data, aes(x = co2, y = growth)) +
  geom_point() +
  theme_minimal() +
  labs(x = "CO2 Emissions", y = "Economic Growth", title = "Relationship between CO2 Emissions and Economic Growth")

library(tidyr)
library(ggplot2)

## 선형회귀 다시 시작
# 이상치 제거

(longdt=dbReadTable(con, "Defaultdata"))
 
longdt2<-longdt[c(1:110),c(2:5)]

# IQR 계산
Q1 <- quantile(longdt2$co2, 0.25, na.rm = TRUE)
Q3 <- quantile(longdt2$co2, 0.75, na.rm = TRUE)
IQR <- Q3 - Q1

# 이상치 기준 설정
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# 이상치가 아닌 데이터만 선택
data_clean <- longdt2[longdt2$co2 >= lower_bound & longdt2$co2 <= upper_bound, ]
 
# co2와 growth의 상관관계를 계산하되, NA 값을 무시합니다.
corre  <- cor(data_clean$co2, data_clean$growth,
              use = "complete.obs")
# 결과를 출력합니다.
print(corre) # 0.3324923 약한 양의 상관관계 확인됨
# 선형 회귀분석을 실행합니다.
lm_model <- lm(growth ~ co2, data=data_clean)
# 요약 결과를 출력합니다.
summary(lm_model) # p-value: 0.0004385



# 예측 값을 생성합니다.
predictions <- predict(lm_model, data_clean)
# MSE를 계산합니다.
mse <- mean((data_clean$growth - predictions)^2)
# MAE를 계산합니다.
mae <- mean(abs(data_clean$growth - predictions))
# RMSE를 계산합니다.
rmse <- sqrt(mse)
# 결과를 출력합니다.
cat("MSE:", mse, "\n")   # MSE: 0.02471766 
cat("MAE:", mae, "\n")   # MAE: 0.1143654 
cat("RMSE:", rmse, "\n") # RMSE: 0.1572185 






# ggplot2 패키지를 불러옵니다.
library(ggplot2)
# ggplot을 사용하 선형 회귀선을 그립니다.
ggplot(data_clean, aes(x = co2, y = growth)) +
geom_smooth(method = "lm", col = "blue") +  # 선형 회귀선
labs(title = "CO2 vs Growth", x = "CO2 Emissions", y = "Economic Growth")

 
# 예측 값을 생성합니다.
predictions <- predict(lm_model, data_clean)
# MSE를 계산합니다.
mse <- mean((data_clean$growth - predictions)^2)
# MAE를 계산합니다.
mae <- mean(abs(data_clean$growth - predictions))
# RMSE를 계산합니다.
rmse <- sqrt(mse)
# 결과를 출력합니다.
cat("MSE:", mse, "\n")   # MSE: 0.02471766 
cat("MAE:", mae, "\n")   # MAE: 0.1143654 
cat("RMSE:", rmse, "\n") # RMSE: 0.1572185 


