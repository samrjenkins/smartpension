# frozen_string_literal: true

require_relative "parser/parse"
require "pry"

Parser::Parse.run(ARGV[0])
