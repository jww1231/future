# 필요한 라이브러리를 불러옵니다.
library(arules)
library(DT)
library(dplyr)

# CSV 파일 읽기 (한국어 인코딩으로 설정)
energy <- read.csv('energy.csv', fileEncoding = 'EUC-KR')

# 데이터 구조 확인
str(energy)

# 열 이름 변경
colnames(energy) <- c("Region", "Nuclear", "LPG", "Coal", "Renewable", "Bio", "Solar", "Wind", "Oil", "PumpedStorage", "Hydro", "Others")

# 첫 번째 행(헤더 정보가 될 수 있음)을 제외하고 데이터를 로드합니다.
energydata <- energy[-1,]

# 빈 값을 0으로 채우기
energydata[energydata == ""] <- 0

# 문자열로 되어 있는 숫자를 정수형으로 변환합니다.
numeric_columns <- c("Nuclear", "LPG", "Coal", "Renewable", "Bio", "Solar", "Wind", "Oil", "PumpedStorage", "Hydro", "Others")
energydata[numeric_columns] <- lapply(energydata[numeric_columns], function(x) as.numeric(as.character(x)))

# 결측치가 포함된 행을 제거합니다.
energydata_clean <- na.omit(energydata)
 
# 빈 문자열을 0으로 먼저 변환
energydata_clean[, -1] <- lapply(energydata_clean[, -1], function(x) {
  x[x == ""] <- 0
  return(as.numeric(x))
})

# 0보다 큰 값을 1로 변환
energydata_clean[, -1] <- lapply(energydata_clean[, -1], function(x) {
  x[x > 0] <- 1
  return(x)
})

# 데이터 타입이 변환되었는지 확인
str(energydata_clean)


