# frozen_string_literal: true

require "test_helper"
require "parser/validators/filepath_validator"
require "parser/models/filepath"

module Parser
  describe FilepathValidator do
    describe ".run" do
      it "adds no errors if log file exists" do
        filepath = Filepath.new(fixture_path)

        FilepathValidator.run(filepath)

        _(filepath.errors).must_be_empty
      end

      it "adds errors if no filepath provided" do
        filepath = Filepath.new(nil)

        FilepathValidator.run(filepath)

        _(filepath.errors).must_include FilepathValidator::NO_FILE_PATH_MSG
      end

      it "adds errors if file is not a `.log`" do
        filepath = Filepath.new("ruby_file.rb")

        FilepathValidator.run(filepath)

        _(filepath.errors).must_include FilepathValidator::NOT_LOG_FILE
      end

      it "adds errors if file does not exist" do
        filepath = Filepath.new("does_not_exist.log")

        FilepathValidator.run(filepath)

        _(filepath.errors).must_include FilepathValidator::NO_FILE_EXIST_MSG
      end
    end
  end
end
