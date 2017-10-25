# README

This is Simple Weather app, weather data by [OpenWeatherMap API](http://openweathermap.org/).

# System dependencies

* Ruby 2.4.2
* Rails 5.1.4
* [direnv](https://direnv.net/)

# Setup

Run just `bin/setup` at project root directory.

# Configuration

* Setup API Key

Sign up with following [How to start - OpenWeatherMap](http://openweathermap.org/appid) and set API key to Enviorment Varialble `OPEN_WEATHER_MAP_API_KEY` to `.direnv`.

* Setup MasterData of City.

```
curl -L http://bulk.openweathermap.org/sample/city.list.min.json.gz | gunzip -c > db/masters/cities.json
```

* Database creation

(TODO)

* Database initialization

(TODO)

* How to run the test suite

(TODO)

* Services (job queues, cache servers, search engines, etc.)

(TODO)

# Improvement Point

* MasterData of City is in static file, but it is easy with deal with geographic location to store in database, I choose simple way for first implementation.

* for production, better to use [encrypted secrets.yml](http://guides.rubyonrails.org/5_1_release_notes.html#encrypted-secrets)
