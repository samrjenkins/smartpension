# frozen_string_literal: true

require "test_helper"
require "parser/views/total_views"

module Parser
  module Views
    describe TotalViews do
      it "outputs header" do
        _(proc do
          TotalViews.render({})
        end).must_output "#{TotalViews::HEADER}\n"
      end

      it "outputs page visits" do
        page1 = mock(path: "page_1", total_visits_count: 1)
        page2 = mock(path: "page_2", total_visits_count: 2)

        _(proc do
          TotalViews.render([page1, page2])
        end).must_output "TOTAL VIEWS\npage_1 1 visits\npage_2 2 visits\n"
      end
    end
  end
end
