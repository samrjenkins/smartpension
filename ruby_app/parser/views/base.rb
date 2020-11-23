# frozen_string_literal: true

module Parser
  module Views
    class Base
      def self.render(pages)
        new(pages).render
      end

      def initialize(pages)
        @pages = pages
      end

      def render
        render_header
        render_counts
      end

      private

      attr_reader :pages

      def render_header
        puts self.class::HEADER
      end

      def render_counts
        pages.each do |page|
          render_count(page)
        end
      end
    end
  end
end
