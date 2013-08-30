module Impressionist
  module ORM

    class SelectAdapter

        @@adapter = :active_record
      # :nodoc:
      # Open up singleton class
      class << self

        # Setup default to ActiveRecord


        # Rails' class_variables method creator
        mattr_accessor :adapter
        
        def adapter_instance_get
          @@adapter_instance ||= adapter_instance_set
        end

        def reset_adapter_instance!
          @@adapter_instance = false
        end

        private

        # :nodoc:
        # Sends a message to ORM asking for a constant
        # which is an adapter's name
        # and then creates an instance of that class
        def adapter_instance_set
          require_current_adapter!
          instance = ORM.const_get(adapter_class_name)
          instance.new
        end

        def adapter_class_name
          adapter.to_s.classify
        end

        def require_current_adapter!
          require "#{root}/impressionist/orm/adapters/#{adapter}"
        end

      end
    end
  end
end
