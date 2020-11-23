# frozen_string_literal: true

require_relative "base"

module Parser
  module Views
    class UniqueViews < Base
      HEADER = "UNIQUE VIEWS"

      private

      def render_count(page)
        puts "#{page.path} #{page.unique_visitors_count} unique views"
      end
    end
  end
end
