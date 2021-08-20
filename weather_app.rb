require "http"

response = HTTP.get("https://api.openweathermap.org/data/2.5/forecast?q=chicago&appid=#{ENV["OPEN_WEATHER_API_KEY"]}")
weather_data = JSON.parse(response.body)

five_day = []

index = 0
while index < 33
  five_day << weather_data["list"][index]["main"]["temp"]
  index += 8
end

p five_day

puts "Please enter a day 1 - 5:"
day1 = gets.chomp.to_i - 1

puts "Please enter a day 1 - 5:"
day2 = gets.chomp.to_i - 1

if five_day[day2] > five_day[day1]
  puts "Day #{day2} is #{five_day[day2] - five_day[day1]} hotter than day #{day1}."
else
  puts "Day #{day1} is #{five_day[day1] - five_day[day2]} hotter than day #{day2}."
end
