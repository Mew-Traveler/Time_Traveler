require_relative 'spec_helper.rb'

describe 'Load specifications' do
  VCR.configure do |c|
    c.cassette_library_dir = CASSETTES_FOLDER
    c.hook_into :webmock

    c.filter_sensitive_data('<AIRBNB_ID>') {ENV['AIRBNB_API'] }
    c.filter_sensitive_data('<GOOGLEMAP_ID>') {ENV['GOOGLE_API'] }
  end

  before do
    VCR.insert_cassette CASSETTE_FILE_GOOGLE, record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  it 'should be able to get the data from Google' do
    google_load = Google::TrafficInfo.find(
      origins: "Taipei",
      destinations: "Hsinchu",
      mode: "Train"
    )

    distance =google_load.trafficAnaly
    distance.length.must_be :>,0
  end
end