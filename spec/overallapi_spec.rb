require_relative 'spec_helper.rb'

describe 'Load specifications' do
  VCR.configure do |c|
    c.cassette_library_dir = CASSETTES_FOLDER
    c.hook_into :webmock

    c.filter_sensitive_data('<CLIENT_ID>') {CREDENTIALS[:airbnb_id]}
    c.filter_sensitive_data('<CLIENT_ID>') {CREDENTIALS[:googlemap_id]}
  end

  before do
    VCR.insert_cassette CASSETTE_FILE, record: :new_episodes

    @airbnb_api = Airbnb::AirbnbApi.new(
      airbnb_id: CREDENTIALS[:airbnb_id]
    )

    @google_api = Google::GoogleApi.new(
      googlemap_id: CREDENTIALS[:googlemap_id]
    )
  end

  after do
    VCR.eject_cassette
  end

  it 'should be able to get the data from Airbnb' do
    airbnb_load = Airbnb::RentInfo.find(
      airbnb_api: @airbnb_api,
      location: "Hsinchu"
    )
    rooms =airbnb_load.infos
    rooms.length.must_be :>,0
  end

  it 'should be able to get the data from Google' do
    google_load = Google::TrafficInfo.find(
      google_api: @google_api,
      origins: "Taipei",
      destinations: "Hsinchu",
      mode: "Train"
    )

    distance =google_load.trafficAnaly
    distance.length.must_be :>,0
  end
end
