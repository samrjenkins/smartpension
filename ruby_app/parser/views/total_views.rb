# frozen_string_literal: true

require_relative "base"

module Parser
  module Views
    class TotalViews < Base
      HEADER = "TOTAL VIEWS"

      private

      def render_count(page)
        puts "#{page.path} #{page.total_visits_count} visits"
      end
    end
  end
end
