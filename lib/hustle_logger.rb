require 'rails_ext/action_dispatch/debug_exceptions'
require 'hustle_logger/engine'
require 'ougai'
require 'ougai_ext/serializers/json_oj'

module HustleLogger
  mattr_accessor :demoted_exceptions

  class Logger < Ougai::Logger
    include ActiveSupport::LoggerThreadSafeLevel
    include ActiveSupport::LoggerSilence

    def create_formatter
      if Rails.env.development? || Rails.env.test?
        Ougai::Formatters::Readable.new
      else
        Ougai::Formatters::Bunyan.new
      end
    end
  end
end
