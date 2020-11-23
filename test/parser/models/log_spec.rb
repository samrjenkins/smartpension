# frozen_string_literal: true

require "test_helper"
require "parser/models/log"

module Parser
  describe Log do
    describe "#each_line" do
      it "iterates over the lines on the log file" do
        log = Log.new(fixture_path)
        expected_output = <<~STR
          /help_page/1 126.318.035.038
          /contact 184.123.665.067
          /help_page/1 126.318.035.038
          /contact 184.123.665.068
          /contact 184.123.665.069
        STR

        _(proc do
          log.each_line do |line|
            puts line
          end
        end).must_output expected_output
      end
    end
  end
end
