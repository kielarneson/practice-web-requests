require "http"

response = HTTP.get("https://api.openweathermap.org/data/2.5/forecast?q=chicago&units=imperial&appid=")
weather_data = JSON.parse(response.body)

city = ["chicago", "dallas", "boston", "phoenix", "seattle"]

city_index = 0
while city_index < city.length
  puts "YOUR 5 DAY FORECAST FOR #{city[city_index].upcase}:"
  puts ""

  index = 0
  while index < weather_data["list"].length
    date = weather_data["list"][index]["dt_txt"].slice(0..9)
    time = weather_data["list"][index]["dt_txt"].slice(11..)
    temp = weather_data["list"][index]["main"]["temp"]
    wind = weather_data["list"][index]["wind"]["speed"]
    feels_like = weather_data["list"][index]["main"]["feels_like"]
    humidity = weather_data["list"][index]["main"]["humidity"]

    puts "On #{date} at #{time}, the temperature in #{city[city_index].capitalize} will be #{temp} degrees with #{humidity}% humidity and a wind speed of #{wind}mph."
    puts "The real-feel temperature will be #{feels_like} degrees."
    puts ""

    index += 8
  end
  index = 0
  city_index += 1

  response = HTTP.get("https://api.openweathermap.org/data/2.5/forecast?q=#{city[city_index]}&units=imperial&appid=git ")
  weather_data = JSON.parse(response.body)
end
