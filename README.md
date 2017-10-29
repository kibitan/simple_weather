# README

This is Simple Weather app, weather data by [OpenWeatherMap API](http://openweathermap.org/).

# System dependencies

* Ruby 2.4.2
* Rails 5.1.4
* PostgreSQL ~> 9.6
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

* How to run the test suite

run `bundle exec rspec`

# Improvement Point

* MasterData of City is in static file, but it is easy with deal with geographic location to store in database, I choose simple way for first implementation.

* for production, better to use [encrypted secrets.yml](http://guides.rubyonrails.org/5_1_release_notes.html#encrypted-secrets)

* in the test mocking API responce of `OpenWeatherMap::Current`

* make [feature spec ](https://relishapp.com/rspec/rspec-rails/docs/feature-specs/feature-spec)

# TODO:

* Write test code for `OpenWeatherMap::Current`, `City`

* make controller and view for display weather

  * make the [Form Object](https://robots.thoughtbot.com/activemodel-form-objects) for display the weather by geographic location, city and country.

    * For city and country form, first select country name by select box from `City.countries`, then city will be loaded by ajax and select city name by select box.

      * use `OpenWeatherMap::Current.find_by_city_id` for city and country and `OpenWeatherMap::Current.find_by_geo` for geographic location

        * NOTE: I want to use [API by city ID](http://openweathermap.org/current#cityid) istead of [API by city name](http://openweathermap.org/current#name), because its less error handling and [official document recommend it](http://openweathermap.org/current#cityid)


      * write test code for Form object

  * make the Decorator by [ActiveDecorator](https://github.com/amatsuda/active_decorator) for displaying weather data `OpenWeatherMap::Current`
