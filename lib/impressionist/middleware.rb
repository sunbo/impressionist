##
# Responsabilities
# Given a valid request
# When a response is sent back
# Then impressionist saves an impression
# through ActiveSupport::Notifications
#
module Impressionist
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(env) 
    end
  end
end
