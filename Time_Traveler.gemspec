$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'Time_Traveler/version'

Gem::Specification.new do |s|
	s.name			= 'Time_Traveler'
	s.version		= 'Time_Traveler::VERSION'

	s.summary		= 'Gets room content from Airbnb'
	s.description	= 'Extracts rent informantion from Airbnb'
	s.authors		= ['Yvonne Shih', 'Cheng-Han Hsieh', 'Wei Tang Lin']
	s.email			= ['yvonshih@gmail.com', 'q2221252@gmail.com', 'wtlin0711@gmail.com']

	s.files			= `git ls-files`.split("\n")
	s.test_files	= `git ls-files -- spec/*`.split("\n")
	s.executables	<< 'Time_Traveler'

	s.add_runtime_dependency 'http', '~> 2.0'

	s.add_development_dependency 'minitest', '~> 5.9'
	s.add_development_dependency 'minitest-rg', '~> 5.2'
	s.add_development_dependency 'rake', '~> 11.3'
	s.add_development_dependency 'vcr', '~> 3.0'
	s.add_development_dependency 'webmock', '~> 2.1'
	s.add_development_dependency 'simplecov', '~> 0.12'
	s.add_development_dependency 'flog', '~> 4.4'
	s.add_development_dependency 'flay', '~> 2.8'
	s.add_development_dependency 'rubocop' '~> 0.42'
	
	s.homepage		= 'https://github.com/Mew-Traveler/Time_Traveler'
	s.license		= 'MIT'
end
