# frozen_string_literal: true
require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'
require 'vcr'
require 'webmock'

require './lib/airbnb_api.rb'
require './lib/google_api.rb'
require './lib/rentinfo.rb'
require './lib/trafficinfo.rb'
require 'simplecov'
SimpleCov.start
require_relative '../lib/facegroup'

FIXTURES_FOLDER = 'spec/fixtures'
CASSETTES_FOLDER = "#{FIXTURES_FOLDER}/cassettes"
CASSETTE_FILE = 'overallapi'

# CREDENTIALS = YAML.load(File.read('config/credentials.yml'))

if File.file?('config/credentials.yml')
  credentials = YAML.load(File.read('config/credentials.yml'))
  ENV['FB_CLIENT_ID'] = credentials[:client_id]
  ENV['FB_CLIENT_SECRET'] = credentials[:client_secret]
  ENV['FB_ACCESS_TOKEN'] = credentials[:access_token]
  ENV['FB_GROUP_ID'] = credentials[:group_id]
end

RESULT_FILE = "#{FIXTURES_FOLDER}/fb_api_results.yml"
FB_RESULT = YAML.load(File.read(RESULT_FILE))
