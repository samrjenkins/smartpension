# frozen_string_literal: true

require "test_helper"
require "parser/views/errors"

module Parser
  module Views
    describe Errors do
      it "outputs errors when provided as arguments" do
        _(proc do
          Errors.render(["Error 1", "Error 2"])
        end).must_output "Error 1\nError 2\n"
      end
    end
  end
end
