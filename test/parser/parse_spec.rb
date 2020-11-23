# frozen_string_literal: true

require "test_helper"
require "parser/parse"

module Parser
  describe Parse do
    describe ".run" do
      it "outputs total and unique view counts in descending order" do
        expected_output = <<~STR
          TOTAL VIEWS
          /contact 3 visits
          /help_page/1 2 visits
          UNIQUE VIEWS
          /contact 3 unique views
          /help_page/1 1 unique views
        STR

        _(proc { Parse.run(fixture_path) }).must_output expected_output
      end

      it "outputs errors when argument invalid" do
        _(proc { Parse.run(nil) }).must_output "Please provide a filepath argument\n"
      end
    end
  end
end
