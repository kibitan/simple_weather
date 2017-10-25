module OpenWeatherMap
  ROOT_API_URL = URI('http://api.openweathermap.org/data/2.5/').freeze
  APP_ID = Rails.application.secrets.open_weather_map_api_key.freeze

  module Base
    extend ActiveSupport::Concern

    class_methods do
      attr_reader :api_url

      def api_end_point(path)
        @api_url ||= ROOT_API_URL.merge(path).freeze
      end

      def api_call(**queries)
        request_url = api_url.dup.tap do |url|
          url.query = URI.encode_www_form(queries.merge(appid: APP_ID))
        end
        Net::HTTP.get_response(request_url)
      end
    end
  end
end
