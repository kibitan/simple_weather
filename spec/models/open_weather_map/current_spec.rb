require 'rails_helper'

RSpec.describe OpenWeatherMap::Current, type: :model do
  describe '.find_by_city_id' do
    subject { OpenWeatherMap::Current.find_by_city_id(city_id) }

    # TODO: mocking api response
    context 'when argument(city_id) is valid' do
      let(:city_id) { 1850147 } # Tokyo

      it { is_expected.not_to be_nil }
      its(:city_name) { is_expected.to eq 'Tokyo' }
      # TODO: check more properties
    end

    context "when argument(city_id) is not valid" do
      let(:city_id) { 0 }

      it { expect{subject}.to raise_error(OpenWeatherMap::CityNotFound) }
    end
  end
end
