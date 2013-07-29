ENV["RAILS_ENV"] = "test"
require 'minitest_helper'
require 'impressionist/middleware'
require 'action_controller'
require 'active_support/notifications'


module ActionController
class PageRequest
  attr_accessor :event
  def intialize
    @event = "2"
  end

  def call(*args)
    @event = ActiveSupport::Notifications::Event.new(*args)
  end
end
end


##
# Given a request is sent to the server
# And goes through the rails middleware stack
# When the response is sent back
# Then Impressionist gets this information by
# subscribing 'action_process.action_controller'

