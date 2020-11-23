# frozen_string_literal: true

module Parser
  class LogPresenter
    def initialize(parsed_log)
      @parsed_log = parsed_log
    end

    def by_total_views
      parsed_log.visited_pages.sort_by(&:total_visits_count).reverse
    end

    def by_unique_visitors
      parsed_log.visited_pages.sort_by(&:unique_visitors_count).reverse
    end

    private

    attr_reader :parsed_log
  end
end
