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
end
