require 'lograge'

Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.formatter = Class.new do |fmt|
    def fmt.call(data)
      { msg: 'Request', request: data }
    end
  end

  # config.lograge.custom_payload do |controller|
  #   {
  #     session_id: controller.session.id
  #   }
  # end

  config.lograge.custom_options = lambda do |event|
    exceptions = %w[controller action format id]
    {
      backtrace: event.payload[:exception_object].try(:backtrace).try(:[], 1..10),
      params: event.payload[:params].except(*exceptions)
    }
  end
  config.lograge.ignore_actions = ['HustleLogger::HealthsController#show'] if ENV['HEALTHCHECK_LOGGING'].blank?
end
