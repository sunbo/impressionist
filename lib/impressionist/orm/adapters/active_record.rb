##
# Responsability
# * Stardardise common methods that
# Impressionist relies on
# * Make those methods available as ClassMethods/InstanceMethods
module Impressionist
  module ORM
  module Adapters
  module ActiveRecord

  extend ActiveSupport::Concern

  module ClassMethods
    # ==> Associations

    # has_many :name, { options }
    def must_have_many(name, options = {})
      self.has_many(name, options)
    end

    # belongs_to :name, { options }
    def must_belong_to(name, options = {})
      self.belongs_to(name, options)
    end

    private(:must_have_many, :must_belong_to)

    # ==> Handling impressions

    def impression_exist?
      true
    end

    # Hint of the day|night
    # Alias is a keyword, lexically scoped,
    # and it treats self as the value of self
    # at the time the source code was read.
    #
    # Whereas
    # alias_method(:new_name, :old_name)
    # Treats self as the value determined at the run time
    # It is a method(function) defined in Module
    #
    # Still wondering?  http://goo.gl/kd4Tty

    def find_an_impression(params)
      self.find(params)
    end

    # ==> Update Counters

    def must_update_counter
    end

  end

  # Make these methods available as InstanceMethods
  include ClassMethods

  end
  end
  end
end

ActiveRecord::Base.
send(:include, Impressionist::ORM::Adapters::ActiveRecord) if defined?(ActiveRecord::Base)
