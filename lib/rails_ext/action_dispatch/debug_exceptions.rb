class ActionDispatch::DebugExceptions
  private

  # alias org_log_error log_error

  def log_error(request, wrapper)
    if demote?(wrapper.exception)
      Rails.logger.info(wrapper.exception.message)
    else
      org_log_error request, wrapper
    end
  end

  def org_log_error(request, wrapper)
    logger = logger(request)
    return unless logger

    exception = wrapper.exception

    trace = wrapper.application_trace
    trace = wrapper.framework_trace if trace.empty?

    ActiveSupport::Deprecation.silence do
      # logger.fatal "  " # Remove from original
      logger.fatal "#{exception.class} (#{exception.message}):"
      log_array logger, exception.annoted_source_code if exception.respond_to?(:annoted_source_code)
      # logger.fatal "  " # Remove from original
      log_array logger, trace
    end
  end

  def demote?(exception)
    demoted_exceptions = [ActionController::RoutingError]
    exception.class.in?(demoted_exceptions)
  end
end
