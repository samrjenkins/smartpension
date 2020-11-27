# frozen_string_literal: true

require "minitest/autorun"
require "pry"

def fixture_path
  "test/fixtures/test.log"
end

def mock(**stubs)
  new_mock = MiniTest::Mock.new
  stubs.each do |method_name, return_value|
    new_mock.expect method_name, return_value
  end
  new_mock
end
