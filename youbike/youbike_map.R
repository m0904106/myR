install.packages("leaflet")
library(leaflet)
#建立 leaflet 物件，並逐一加入與地圖相關的屬性。底下的程式碼執行完成後會得到一張地圖，地圖上有個標籤標注在緯度 25.1753 經度 121.4335 也就是淡水紅毛城的位置。

map <- leaflet()
map <- addTiles(map)
map <- addMarkers(map, lat = 25.1753, lng = 121.4335) # 淡水紅毛城 
map