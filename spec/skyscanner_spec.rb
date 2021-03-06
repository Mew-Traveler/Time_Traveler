require_relative 'spec_helper.rb'

describe 'Load specifications' do
  VCR.configure do |c|
    c.cassette_library_dir = CASSETTES_FOLDER
    c.hook_into :webmock

    c.filter_sensitive_data('<SKYSCANNER_ID>') {ENV['SKYSCANNER_API'] }
  end

  before do
    VCR.insert_cassette CASSETTE_FILE_SKYSCANNER, record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  it 'should be able to get the data from Skyscanner' do
    skyscanner_load = Skyscanner::FlightInfo.find(market: 'TW', currency: 'TWD', locale: 'en-GB', originPlace: 'TW', destinationPlace: 'UK', outboundPartialDate: 'anytime')
    flightInfo = skyscanner_load.flightInfo
    print skyscanner_load
    flightInfo.length.must_be :>,0
  end

end
