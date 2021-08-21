require "http"

while true
  puts "Please enter a city: (When finished entering cities, enter 'done')"
  city = gets.chomp

  if city == "done"
    break
  else
    response = HTTP.get("https://api.openweathermap.org/data/2.5/forecast?q=#{city}&units=imperial&appid=957fc661851a99f95fdde9570a951517")
    weather_data = JSON.parse(response.body)

    puts ""
    puts "YOUR 5 DAY FORECAST FOR #{city.upcase}:"
    puts ""

    index = 0
    while index < weather_data["list"].length
      date = weather_data["list"][index]["dt_txt"].slice(0..9)
      time = weather_data["list"][index]["dt_txt"].slice(11..)
      temp = weather_data["list"][index]["main"]["temp"]
      wind = weather_data["list"][index]["wind"]["speed"]
      feels_like = weather_data["list"][index]["main"]["feels_like"]
      humidity = weather_data["list"][index]["main"]["humidity"]

      puts "On #{date} at #{time}, the temperature in #{city.capitalize} will be #{temp} degrees with #{humidity}% humidity and a wind speed of #{wind}mph."
      puts "The real-feel temperature will be #{feels_like} degrees."
      puts ""

      index += 8
    end
  end
end
