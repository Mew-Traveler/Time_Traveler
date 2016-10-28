# frozen_string_literal: true
require 'rake/testtask'

task default: :spec

# desc 'Run specs'
# Rake::TestTask.new(name=:spec) do |t|
#   t.pattern = 'spec/*_spec.rb'
# end

desc 'run tests'
task :spec do
  sh 'ruby spec/airbnbapi_spec.rb'
  sh 'ruby spec/googledistanceapi_spec.rb'

end

desc 'delete cassette fixtures'
task :wipe do
  sh 'rm spec/fixtures/cassettes/*.yml' do |ok, _|
    puts(ok ? 'Cassettes deleted' : 'No casseettes found')
  end
end

namespace :quality do
  desc 'run all quality checks'
  task all: [:rubocop, :flog, :flay]

  task :flog do
    sh 'flog lib/'
  end

  task :flay do
    sh 'flay lib/'
  end

  task :rubocop do
    sh 'rubocop'
  end
end
