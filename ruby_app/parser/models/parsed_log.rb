# frozen_string_literal: true

require_relative "./page"

require "set"

module Parser
  class ParsedLog
    def initialize(log)
      @log = log
      @parsed = false
    end

    def visited_pages
      parse unless parsed
      index.values
    end

    private

    attr_reader :log
    attr_accessor :parsed

    def parse
      log.each_line do |line|
        path, visitor = line.split

        page(path).add_visitor(visitor)
      end

      self.parsed = true
    end

    def index
      @_index ||= Hash.new do |hash, key|
        hash[key.to_sym] = Page.new(key)
      end
    end

    def page(path)
      index[path.to_sym]
    end
  end
end
