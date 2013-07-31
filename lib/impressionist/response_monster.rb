require 'impressionist/minion_creator'

module Impressionist
    ##
    # In order to identify what controller is set
    # to save an impression.
    # ResponseMonster receives a hash of data by
    # subscribing 'process_action.action_controller' and
    # asks Pool whether or not it has this method defined
    # whose name is the controller name
    # from the parameters ResponseMonster received via method #call
    #
    # See rubyonrails.org/active_support_instrumentation.html
    #
    # Given ResponseMonster receives this hash of arguments
     #  {
     #    controller: "PapoyController",
     #    action: "index",
     #    params: {"action" => "index", "controller" => "papoy"},
     #    format: :html,
     #    method: "GET",
     #    path: "/papoy",
     #    status: 200,
     #    view_runtime: 46.848,
     #    db_runtime: 0.157
     #  }
    #
    # And ResponseMonster asks pool for #posts method
    # Then Pool finds this method and returns a hash of data
    # which was defined in:
    #
    #   config/initializers/impressionist.rb
    #   Impressionist.minion do |at|
    #     at(:papoy, [:index, :show])
    #   end
    #
    # Then an impression must be saved based on these hash of data
    #
    # And Pool does not have this method defined
    # Then an impressionist must not be saved
    #

  class ResponseMonster

    def self.call(*response)
      new(*response)
    end

    attr_reader :response, :minions

    def initialize(response)
      @minions = Minions
      @response = response
    end


    def ask_pool_for_method
    end

  end
end
