require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task :default => :test

# task :testa do |task|
#   puts "GG"
# end

# require "rails/test_unit/runner"

# task default: [:test]

# task :test do |task|
#   return 1 unless system("cd javascript && yarn run test")
#   Rails::TestUnit::Runner.run
# end

# task :test_ruby do |task|
#   Rails::TestUnit::Runner.run
# end