class ActionDispatch::DebugExceptions
  private

  alias org_log_error log_error

  def log_error(request, wrapper)
    if demote?(wrapper.exception)
      Rails.logger.info(wrapper.exception.message)
    else
      org_log_error request, wrapper
    end
  end

  def demote?(exception)
    demoted_exceptions = [ActionController::RoutingError]
    exception.class.in?(demoted_exceptions)
  end
end
