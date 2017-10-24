class City < ActiveJSON::Base
  set_root_path "db/masters"

  class << self
    # return all country code
    def countries
      all.map(&:country).uniq
    end
  end
end
