# frozen_string_literal: true

require_relative "views/total_views"
require_relative "views/unique_views"
require_relative "views/errors"
require_relative "models/log"
require_relative "models/parsed_log"
require_relative "models/filepath"
require_relative "presenters/log_presenter"

module Parser
  class Parse
    def self.run(user_string)
      new(user_string).run
    end

    def initialize(user_string)
      @user_string = user_string
    end

    def run
      return render_errors if filepath.invalid?

      Views::TotalViews.render(log_presenter.by_total_views)
      Views::UniqueViews.render(log_presenter.by_unique_visitors)
    end

    private

    attr_reader :user_string

    def log_presenter
      LogPresenter.new(parsed_log)
    end

    def render_errors
      Views::Errors.render(filepath.errors)
    end

    def parsed_log
      @_parsed_log ||= ParsedLog.new(log)
    end

    def log
      @_log ||= Log.new(filepath)
    end

    def filepath
      @_filepath ||= Filepath.new(user_string)
    end
  end
end
