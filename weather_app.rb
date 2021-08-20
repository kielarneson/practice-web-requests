require "http"

#{ENV["OPEN_WEATHER_API_KEY"]}

response = HTTP.get("https://api.openweathermap.org/data/2.5/forecast?q=chicago&units=imperial&appid=")
weather_data = JSON.parse(response.body)

# pp weather_data["list"][0]

temp_array = []
real_feel_array = []

puts "YOUR 5 DAY FORECAST FOR CHICAGO:"
puts ""

index = 0
while index < weather_data["list"].length
  date = weather_data["list"][index]["dt_txt"].slice(0..9)
  time = weather_data["list"][index]["dt_txt"].slice(11..)
  temp = weather_data["list"][index]["main"]["temp"]
  feels_like = weather_data["list"][index]["main"]["feels_like"]
  humidity = weather_data["list"][index]["main"]["humidity"]

  temp_array << weather_data["list"][index]["main"]["temp"]
  real_feel_array << weather_data["list"][index]["main"]["feels_like"]

  puts "On #{date} at #{time}, the temperature in Chicago will be #{temp} degrees with #{humidity}% humidity."
  puts "The real-feel temperature will be #{feels_like} degrees."
  puts ""

  index += 8
end

index = 0
temp_sum = 0
real_feel_sum = 0

while index < temp_array.length
  temp_sum += temp_array[index]
  real_feel_sum += real_feel_array[index]
  index += 1

  temp_average = temp_sum / temp_array.length
  real_feel_average = real_feel_sum / real_feel_array.length
end

puts "The average temperature for the next 5 days is #{temp_average} degrees,"
puts "with a real-feel average of #{real_feel_average} degress."
