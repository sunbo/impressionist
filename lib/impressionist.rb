require 'impressionist/load'

module Impressionist

  mattr_accessor :orm
  self.orm = :active_record

  class << self

    def setup
      yield self
    end

    alias :minions :instance_eval
  
    def create(name, *options)
      MinionCreator.new(name, options)
    end
  end

end
