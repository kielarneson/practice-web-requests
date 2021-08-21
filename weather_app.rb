require "http"

# Environmet API Key storage
#{ENV["OPEN_WEATHER_API_KEY"]}

# Accessing openweathermap.org
response = HTTP.get("https://api.openweathermap.org/data/2.5/forecast?q=miami&units=imperial&appid=")
# Parsing weather data
weather_data = JSON.parse(response.body)

# Understanding weather data
# pp weather_data["list"][0]

# Empty arrays for averages
temp_array = []
real_feel_array = []
city = ["miami"]

puts "YOUR 5 DAY FORECAST FOR #{city[0].upcase}:"
puts ""

# Loop to display 5 day forecast elements
index = 0
while index < weather_data["list"].length
  # Individual elements
  date = weather_data["list"][index]["dt_txt"].slice(0..9)
  time = weather_data["list"][index]["dt_txt"].slice(11..)
  temp = weather_data["list"][index]["main"]["temp"]
  feels_like = weather_data["list"][index]["main"]["feels_like"]
  humidity = weather_data["list"][index]["main"]["humidity"]

  # Moving elements to arrays
  temp_array << weather_data["list"][index]["main"]["temp"]
  real_feel_array << weather_data["list"][index]["main"]["feels_like"]

  # Printing 5 day forecast elements
  puts "On #{date} at #{time}, the temperature in #{city[0].capitalize} will be #{temp} degrees with #{humidity}% humidity."
  puts "The real-feel temperature will be #{feels_like} degrees."
  puts ""

  index += 8
end

# Average variables
index = 0
temp_sum = 0
real_feel_sum = 0

# Average loop
while index < temp_array.length
  temp_sum += temp_array[index]
  real_feel_sum += real_feel_array[index]
  index += 1

  # Calculating averages
  temp_average = temp_sum / temp_array.length
  real_feel_average = real_feel_sum / real_feel_array.length
end

# Printing averages
puts "The average temperature for the next 5 days is #{temp_average} degrees,"
puts "with a real-feel average of #{real_feel_average} degress."
