# frozen_string_literal: true

require "test_helper"
require "parser/models/log"
require "parser/models/parsed_log"

module Parser
  describe ParsedLog do
    describe "#visited_pages" do
      it "returns an array of page objects" do
        log = Log.new(fixture_path)
        parsed_log = ParsedLog.new(log)

        parsed_log.visited_pages.each do |visited_page|
          _(visited_page).must_be_kind_of Page
        end
      end

      it "each page has the correct number of total visits" do
        log = Log.new(fixture_path)
        parsed_log = ParsedLog.new(log)
        visited_pages = parsed_log.visited_pages
        help_page = visited_pages.find { |page| page.path == :"/help_page/1" }
        contact_page = visited_pages.find { |page| page.path == :"/contact" }

        _(help_page.total_visits_count).must_equal 2
        _(contact_page.total_visits_count).must_equal 3
      end

      it "each page has the correct number of unique visits" do
        log = Log.new(fixture_path)
        parsed_log = ParsedLog.new(log)
        visited_pages = parsed_log.visited_pages
        help_page = visited_pages.find { |page| page.path == :"/help_page/1" }
        contact_page = visited_pages.find { |page| page.path == :"/contact" }

        _(help_page.unique_visitors_count).must_equal 1
        _(contact_page.unique_visitors_count).must_equal 3
      end
    end
  end
end
