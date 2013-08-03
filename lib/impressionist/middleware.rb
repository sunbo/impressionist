##
# Responsabilities
# Given a valid request
# When a response is sent back
# Then impressionist saves an impression
# by subscribing to 'action_process.action_controller
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
