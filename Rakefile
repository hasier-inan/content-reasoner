require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'rubygems'
require 'bundler'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = 'content-reasoner'
  gem.homepage = 'https://github.com/hasier-inan/content-reasoner'
  gem.summary = 'Provides a Preference as a result of a case based reasoning rules execution.'
  gem.description = 'The content-reasoner uses a CBR logic to provide the best matching content to a given '\
  'set of preferences, based on previously saved knowledge defined as rules.'
  gem.email = 'hasier-inanmanzanares@sky.uk'
  gem.authors = ['Hasier Inan']
  gem.files.exclude 'spec/**/*'
end
# rake gemspec
Jeweler::RubygemsDotOrgTasks.new

RuboCop::RakeTask.new
RSpec::Core::RakeTask.new

task :rubocop_a do
  `rubocop -a`
end

task default: [:spec, :rubocop_a, :rubocop]
