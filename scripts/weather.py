from httpx import get
from dotenv import load_dotenv
from os import getenv

load_dotenv()

KEY = getenv("OPENWEATHERMAP_API_KEY")
ID = "623407"  # 629634 - Брест, 623407 - Подлесье
UNIT = "metric"

resp = get(
    f"https://api.openweathermap.org/data/2.5/weather?APPID={KEY}&id={ID}&units={UNIT}"
)
weather = resp.json()
temp = round(weather["main"]["temp"])
print(temp)
