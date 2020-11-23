# frozen_string_literal: true

require "test_helper"
require "parser/models/filepath"

module Parser
  describe Filepath do
    describe "#to_s" do
      it "returns filepath string" do
        _(Filepath.new("filepath").to_s).must_equal "filepath"
      end

      it "returns empty string when instatiated with nil" do
        _(Filepath.new(nil).to_s).must_equal ""
      end
    end

    describe "#invalid?" do
      it "returns true when filepath invalid" do
        _(Filepath.new("invalid_filepath")).must_be :invalid?
      end

      it "returns false when filepath invalid" do
        _(Filepath.new(fixture_path)).wont_be :invalid?
      end
    end
  end
end
