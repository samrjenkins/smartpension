# frozen_string_literal: true

require_relative "../../../config"

module Parser
  class Log
    def initialize(file_path)
      @file_path = file_path
    end

    def each_line(&block)
      within_open_file do |file_lines|
        file_lines.each(&block)
      end
    end

    private

    attr_reader :file_path

    def within_open_file(&block)
      File.open("#{Config.path_to_app_root}#{file_path}", &block)
    end
  end
end
