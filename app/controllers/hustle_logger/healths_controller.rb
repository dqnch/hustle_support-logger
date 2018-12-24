module HustleLogger
  class HealthsController < ActionController::Base
    def show
      render plain: 'healthy!'
    end
  end
end
