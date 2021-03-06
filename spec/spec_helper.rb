# frozen_string_literal: true
require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'
require 'vcr'
require 'webmock'

# require './lib/airbnb_api.rb'
# require './lib/google_api.rb'
# require './lib/rentinfo.rb'
# require './lib/trafficinfo.rb'
require_relative '../lib/Time_Traveler'

FIXTURES_FOLDER = 'spec/fixtures'
CASSETTES_FOLDER = "#{FIXTURES_FOLDER}/cassettes"
CASSETTE_FILE_GOOGLE = 'google_distances'
CASSETTE_FILE_AIRBNB = 'airbnb_rooms'
CASSETTE_FILE_SKYSCANNER = 'skyscanner_flights'

if File.file?('config/app.yml')
  credentials = YAML.load(File.read('config/app.yml'))
  ENV['AIRBNB_API'] = credentials['development']['AIRBNB_API']
  ENV['GOOGLE_API'] = credentials['development']['GOOGLE_API']
  ENV['SKYSCANNER_API'] = credentials['development']['SKYSCANNER_API']
end

RESULT_FILE_AIRBNB = "#{FIXTURES_FOLDER}/airbnb_api_results.yml"
RESULT_FILE_GOOGLEMAP = "#{FIXTURES_FOLDER}/googlemap_api_results.yml"
RESULT_FILE_SKYSCANNER = "#{FIXTURES_FOLDER}/skyscanner_api_results.yml"
# AIRBNB_RESULT = YAML.load(File.read(RESULT_FILE_AIRBNB))
# GOOGLEMAP_RESULT = YAML.load(File.read(RESULT_FILE_GOOGLEMAP))
