# frozen_string_literal: true

module Parser
  class FilepathValidator
    NO_FILE_PATH_MSG = "Please provide a filepath argument"
    NO_FILE_EXIST_MSG = "File does not exist"
    NOT_LOG_FILE = "Can only parse `.log` files"

    def self.run(filepath)
      new(filepath).run
    end

    def initialize(filepath)
      @filepath = filepath
    end

    def run
      validate :ensure_filepath_present
      validate :ensure_log_file
      validate :ensure_file_exists
    end

    private

    attr_reader :filepath

    def validate(validation)
      return if errors.any?

      send validation
    end

    def errors
      filepath.errors
    end

    def ensure_filepath_present
      return unless filepath.to_s.strip.empty?

      errors << NO_FILE_PATH_MSG
    end

    def ensure_file_exists
      return if File.exist?(Config.path_to_app_root << filepath.to_s)

      errors << NO_FILE_EXIST_MSG
    end

    def ensure_log_file
      return if /.log\z/.match? filepath.to_s

      errors << NOT_LOG_FILE
    end
  end
end
