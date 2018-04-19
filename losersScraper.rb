# returns biggest % losers in the last 24h
# writes results to losersData.txt

require 'bundler/setup'

require 'rails'

require 'pry-rails'

require 'nokogiri'

require 'open-uri'

loop do |updat|
  doc = Nokogiri::HTML.parse(open("https://coinmarketcap.com/gainers-losers/"))
  coinsTable = doc.css("table.trending-losers-table").sort { |x, y| y.css("tr").count <=> x.css("tr").count }[2]
  rows = coinsTable.css("tr")
  rows = rows.select { |row| row.css("th").empty? }
  data = rows.map do |row|
    [row.at_css("td:nth-child(1)").text ] + [row.at_css("td:nth-child(2)").text.gsub(/\s+/, "") ] + [row.at_css("td:nth-child(5)").text.gsub(/\s+/, "") ] + [row.at_css("td:nth-child(6)").text ]
  end
  open('losersData.txt', 'w') do |f|
    f.puts data
  end
  puts Time.now
  sleep 5
end
