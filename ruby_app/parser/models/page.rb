# frozen_string_literal: true

module Parser
  class Page
    def initialize(path)
      @path = path.to_sym
      @total_visits_count = 0
      @unique_visitors = Set.new
    end

    def add_visitor(visitor_ip)
      @total_visits_count += 1
      @unique_visitors << visitor_ip.to_sym
    end

    def unique_visitors_count
      @unique_visitors.size
    end

    attr_reader :total_visits_count, :path
  end
end
