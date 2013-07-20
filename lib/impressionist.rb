require 'impressionist/load'

module Impressionist

  mattr_accessor :orm
  self.orm = :active_record

  def self.setup
    yield self
  end

end
