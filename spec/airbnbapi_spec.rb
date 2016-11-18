require_relative 'spec_helper.rb'

describe 'Load specifications' do
  VCR.configure do |c|
    c.cassette_library_dir = CASSETTES_FOLDER
    c.hook_into :webmock

    c.filter_sensitive_data('<AIRBNB_ID>') {ENV['AIRBNB_API'] }
  end

  before do
    VCR.insert_cassette CASSETTE_FILE_AIRBNB, record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  it 'should be able to get the data from Airbnb' do
    airbnb_load = Airbnb::RentInfo.find(location: 'Hsinchu')
    rooms = airbnb_load.infos
    rooms.length.must_be :>,0
  end

end
