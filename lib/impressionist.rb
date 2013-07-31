require 'impressionist/load'

module Impressionist

  # ActiveRecord as default
  mattr_accessor :orm
  self.orm = :active_record

  class << self

    def setup
      yield self
    end

    # We do not have to pass args to a block
    # One just call the method create as self
    # will be set to Impressionist
    alias :minions :instance_eval
  
    def create(name, *options)
      MinionCreator.new(name, *options)
    end

  end

end
