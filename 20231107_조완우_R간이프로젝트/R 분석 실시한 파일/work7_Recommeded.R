electric<- read.csv('electric.csv', fileEncoding = 'EUC-KR')
str(electric)
library(tidyr)

electric <- data.frame(electric)
colnames(electric)<- c("country", "code", "Year" ,"Other.renewables" , "bioenergy" ,
                       "solar", "wind","hydro", 
                       "nuclear", "oil" , "gas","coal")

str(electric)
electric_2022 <- subset(electric, Year == 2022)

str(electric_2022)

electric_2022_nocode <- subset(electric_2022, code != "")
str(electric_2022_nocode)
electric_2022_nocode2 <- subset(electric_2022_nocode, select = -c(Other.renewables, Year, bioenergy, hydro, oil, code))


library(tidyr)
library(dplyr)
library(ggplot2)

# 각 나라별로 총 에너지 소비를 계산합니다.
selected_countries <- electric_2022_nocode2 %>%
  filter(country %in% c("Sweden", "Belgium", "Finland", "Switzerland", "Slovakia", "Hungary", "Norway", "Denmark")) %>%
  mutate(total = solar + wind + nuclear + gas + coal)

# 데이터를 긴 형식으로 변환합니다.
selected_countries_long <- selected_countries %>%
  pivot_longer(cols = solar:coal, names_to = "energy_source", values_to = "value") %>%
  mutate(percentage = value / total * 100)

# ggplot을 사용하여 정규화된 스택 바 차트를 생성합니다.
ggplot(selected_countries_long, aes(x = country, y = percentage, fill = energy_source)) +
  geom_bar(stat = "identity", position = "fill") + # position fill을 사용하여 정규화된 바를 생성합니다.
  theme(axis.text.x = element_text(angle = 0, hjust = 1)) +
  labs(y = "Energy Consumption (%)", x = "Country", fill = "Energy Source", title = "2022년 선진국 에너지 비중") +
  scale_fill_manual(values = c("gas" = "#bdbdbd","coal" = "black", "solar" = "#f44338", "wind" = "#91d4fa", "nuclear" = "#ffee80")) +
                      guides(fill = guide_legend(title = "에너지")) 


# 'Germany'에 해당하는 데이터만 필터링하고, 필요한 데이터만 남깁니다.
germany_energy <- electric_2022_nocode2 %>%
  filter(country == "France") %>%
  mutate(total = solar + wind + nuclear + gas + coal)

# 데이터를 긴 형식으로 변환합니다.
germany_energy_long <- germany_energy %>%
  pivot_longer(cols = solar:coal, names_to = "energy_source", values_to = "value") %>%
  mutate(percentage = value / total * 100)

# 원형 그래프를 그립니다.
ggplot(germany_energy_long, aes(x = "", y = percentage, fill = energy_source)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0) +
  theme_void() +
  scale_fill_manual(values = c("gas" = "#bdbdbd","coal" = "black", "solar" = "#f44338", "wind" = "#91d4fa", "nuclear" = "#ffee80")) +
  guides(fill = guide_legend(title = "에너지 구성비     "))  

