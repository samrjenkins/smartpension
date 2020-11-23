# frozen_string_literal: true

require "test_helper"
require "parser/models/page"

module Parser
  describe Page do
    describe "#path" do
      it "returns the symbolized path value provided on instantiation" do
        _(Page.new("path_value").path).must_equal :path_value
      end
    end

    describe "#total_visits_count" do
      it "returns 0 for new object instance" do
        _(Page.new("path_value").total_visits_count).must_equal 0
      end
    end

    describe "#unique_visitors_count" do
      it "returns 0 for new object instance" do
        _(Page.new("path_value").unique_visitors_count).must_equal 0
      end
    end

    describe "#add_visitor" do
      it "increments total_visits_count" do
        page = Page.new("path_value")
        page.add_visitor("visitor_ip")

        _(page.total_visits_count).must_equal 1
      end

      it "increments unique_visitors_count" do
        page = Page.new("path_value")
        page.add_visitor("visitor_ip")

        _(page.unique_visitors_count).must_equal 1
      end
    end
  end
end
