# frozen_string_literal: true

require_relative "../validators/filepath_validator"

module Parser
  class Filepath
    def initialize(string)
      @string = string
      @errors = []
    end

    def invalid?
      FilepathValidator.run(self)
      errors.any?
    end

    def to_s
      string.to_s
    end

    attr_reader :errors

    private

    attr_reader :string
  end
end
