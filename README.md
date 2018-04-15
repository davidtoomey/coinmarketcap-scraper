# coinmarketcap-scraper

scrapes name, price, and 24hr % change for the top 100 coins on coinmarketcap.
writes output to data.txt every 5 seconds.

## Getting Started
```
git clone https://github.com/davidtoomey/coinmarketcap-scraper.git
```
```
cd coinmarketcap-scraper
```
```
bundle install
```
## Get top 100 coins
```
ruby coinScraper.rb
```
new data should be written to data.txt every 5 seconds,
and a timestamp of the last updated time will print
in the console

## Biggest % Gainers/Losers in the last 24h

biggest gainers 24h // writes data to gainersData.txt every 5 seconds
```
ruby gainersScraper.rb
```
biggest losers 24h // writes data to losersData.txt every 5 seconds
```
ruby losersScraper.rb
```




