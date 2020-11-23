# frozen_string_literal: true

require "test_helper"
require "parser/views/unique_views"

module Parser
  module Views
    describe UniqueViews do
      it "outputs header" do
        _(proc do
          UniqueViews.render({})
        end).must_output "#{UniqueViews::HEADER}\n"
      end

      it "outputs page visits" do
        page1 = mock(path: "page_1", unique_visitors_count: 1)
        page2 = mock(path: "page_2", unique_visitors_count: 2)

        _(proc do
          UniqueViews.render([page1, page2])
        end).must_output "UNIQUE VIEWS\npage_1 1 unique views\npage_2 2 unique views\n"
      end
    end
  end
end
