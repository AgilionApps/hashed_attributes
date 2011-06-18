require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'

# Run the test with 'rake' or 'rake test'
desc 'Default: run hashed_attributes unit tests.'
task :default => :test

desc 'Test the hashed_attributes gem.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/*_test.rb'
  t.verbose = true
end
