import requests

KEY="a957e8b9e8c3cd8b990efa61ec2c739c"
ID="623407" # 629634 - Брест, 623407 - Подлесье
UNIT="metric"

resp = requests.get(f'https://api.openweathermap.org/data/2.5/weather?APPID={KEY}&id={ID}&units={UNIT}')
weather = resp.json()
temp = round(weather["main"]["temp"])
print(temp)
