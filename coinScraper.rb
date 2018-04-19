require 'bundler/setup'

require 'rails'

require 'pry-rails'

require 'nokogiri'

require 'open-uri'

loop do |updat|
  doc = Nokogiri::HTML.parse(open("https://coinmarketcap.com"))
  coinsTable = doc.css("table").sort { |x, y| y.css("tr").count <=> x.css("tr").count }.first
  rows = coinsTable.css("tr")
  rows = rows.select { |row| row.css("th").empty? }
  data = rows.map do |row|
    [row.at_css("td:nth-child(2)").text + row.at_css("td:nth-child(4)").text.gsub(/\s+/, "")]
  end
  open('data.txt', 'w') do |f|
    f.puts data
  end
  puts Time.now
  sleep 5
end
