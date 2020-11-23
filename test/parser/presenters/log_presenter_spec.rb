# frozen_string_literal: true

require "test_helper"
require "parser/presenters/log_presenter"

module Parser
  describe LogPresenter do
    describe "#by_total_views" do
      it "returns array of pages sorted by descending total views count" do
        mock_page1 = mock(total_visits_count: 1)
        mock_page2 = mock(total_visits_count: 2)
        mock_parsed_log = mock(visited_pages: [mock_page1, mock_page2])
        log_presenter = LogPresenter.new(mock_parsed_log)

        _(log_presenter.by_total_views).must_equal [mock_page2, mock_page1]
      end
    end

    describe "#by_unique_visitors" do
      it "returns array of pages sorted by descending unique visitors count" do
        mock_page1 = mock(unique_visitors_count: 1)
        mock_page2 = mock(unique_visitors_count: 2)
        mock_parsed_log = mock(visited_pages: [mock_page1, mock_page2])
        log_presenter = LogPresenter.new(mock_parsed_log)

        _(log_presenter.by_unique_visitors).must_equal [mock_page2, mock_page1]
      end
    end
  end
end
