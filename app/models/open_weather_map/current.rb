class OpenWeatherMap::Current
  include OpenWeatherMap::Base
  # http://openweathermap.org/current#one
  api_end_point 'weather'

  class << self
    # http://openweathermap.org/current#cityid
    def find_by_city_id(city_id)
      api_call(id: city_id)
    end

    # http://openweathermap.org/current#name
    def find_by_city_name(city_name, country_code: nil)
      if country_code.present?
        api_call(q: "#{city_name}, #{country_code}")
      else
        api_call(q: city_name)
      end
    end

    # http://openweathermap.org/current#geo
    def find_by_geo(lat:, lon:)
      api_call(lat: lat, lon: lon)
    end
  end

  # http://openweathermap.org/current#parameter
  attr_reader *%i(
    city_id
    city_name
    country_code
    time
    coord_lon
    coord_lat
    time
    temperature
    pressure
    humidity
    temperature_max
    temperature_min
    sea_level
    grnd_level
    wind_speed
    wind_deg
    cloudiness
    rain_3h
    snow_3h
    sunrise_time
    sunset_time
  )

  def initialize(json)
    @city_id      = json.fetch('id')
    @city_name    = json.fetch('name')
    @country_code = json.fetch('sys').fetch('country')
    @time         = Time.at(json.fetch('dt'))

    json.fetch('coord').tap do |coord|
      @coord_lon = coord.fetch('lon')
      @coord_lat = coord.fetch('lat')
    end

    json.fetch('main').tap do |main|
      @temperature     = main.fetch('temp')
      @pressure        = main.fetch('pressure')
      @humidity        = main.fetch('humidity')
      @temperature_max = main.fetch('temp_min')
      @temperature_min = main.fetch('temp_max')
      @sea_level       = main.fetch('sea_level', nil)
      @grnd_level      = main.fetch('grnd_level', nil)
    end

    json.fetch('wind').tap do |wind|
      @wind_speed = wind.fetch('speed')
      @wind_deg   = wind.fetch('deg')
    end

    @cloudiness = json.fetch('clouds').fetch('all')
    @rain_3h    = json.fetch('rain', nil)&.fetch('3h', nil)
    @snow_3h    = json.fetch('snow', nil)&.fetch('3h', nil)
    @sunrise    = Time.at(json.fetch('sys').fetch('sunrise'))
    @sunset     = Time.at(json.fetch('sys').fetch('sunset'))
  end
end
