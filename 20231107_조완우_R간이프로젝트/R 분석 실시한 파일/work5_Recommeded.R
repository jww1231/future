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

# 각 수치 데이터 열에 대해 구간 범주화 진행
breaks <- c(-Inf, 0, 20, 50, 75, Inf)
numeric_columns <- setdiff(names(energydata_clean), "Region")
for(column in numeric_columns) {
  energydata_clean[[column]] <- cut(as.numeric(energydata_clean[[column]]), 
                                    breaks = breaks, 
                                    labels = c("NONE", "VERY LOW", "LOW", "MIDDLE", "HIGH"),
                                    include.lowest = TRUE)
}

# 'Region' 열을 제외하고 transactions 객체로 변환합니다.
energydata_trans <- as(energydata_clean[-1], "transactions")

# apriori 알고리즘을 적용합니다.
basket_rules <- apriori(energydata_trans, 
                        parameter = list(sup = 0.5, conf = 0.5, target = "rules", minlen=2))

# 연관 규칙을 데이터 프레임으로 변환합니다.
rules_df <- as(basket_rules, "data.frame")

# 연관 규칙을 DataTables 위젯으로 만듭니다.
rules_widget <- datatable(rules_df)

# 위젯을 HTML 파일로 저장합니다.
saveWidget(rules_widget, 'rules.html', selfcontained = TRUE)

# 웹 브라우저에서 HTML 파일을 엽니다.
browseURL('rules.html')
