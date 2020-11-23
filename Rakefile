# frozen_string_literal: true

require "rake/testtask"
require "rubocop/rake_task"

# $ rake rubocop
RuboCop::RakeTask.new

# $ rake test
Rake::TestTask.new do |t|
  t.libs << "ruby_app"
  t.libs << "test"
  t.test_files = FileList["test/**/*_spec.rb"]
end

task default: %i[rubocop test]
