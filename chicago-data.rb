require "http"

response = HTTP.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json")

employees = JSON.parse(response.body)

index = 0
while index != 2
  puts "#{employees[index]["name"]} makes #{employees[index]["annual_salary"]} dollars per year."
  index += 1
end
