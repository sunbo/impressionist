##
# Minions are small, yellow, cylinder-shaped,
# creatures that have one or two eyes and they love
# Bananaaaa! Potato-naaaa!
#
# A minion is very smart,
# You create one by giving him a name and
# something to eat. ( banaaaa )
# Impressionist.minion(:tom, [:actions], [:options])
#
# List of minions created
# Impressionist.minions do |create|
#
#   SAAB = Same as above but
#
#   # Logs an impression for any action, but doesn't update_counters
#   create(:papoy)
#
#   # SAAB for those two actions
#   create(:papoy, [:a_toy, :show])
#
#   # SAAB filters unique impressions
#   create(:papoy, :show, unique: :ip_address)
#
#   # SAAB but ...
#   create(:papoy, :show, unique: [:ip_address, :request_hash])
#
#   # Oh yeah SAAB updates counters now
#   # Minion tries to use its controller name as its Model name.
#   create(:papoy, :show, counter_cache => true)
#
#   # SAAB changes column name of Papoy to impressions
#   # default is impressions_count
#   create(:papoy, :show, counter_cache => {:column_name: :impressions})
#
#   # SAAB specifies a different entity 'class_name'
#   # One would pass a class name if Controller talks to
#     a different Model (i.e Not the same name as the controller)
#   create(:papoy, :show,
#     counter_cache => {
#       column_name: :impressions,
#       class_name: 'Poypa'
#     })
#
# Becomes:
# define_method :papoy do
#   Hash of actions and options
#   {
#     actions: [:show],
#     options: {
#       column_name: :impressions,
#       class_name: :Poypa
#      }
#   }
# end
# end

module Impressionist

  ##
  # Creates a minion and feeds it
  # when MinionCreator tells it to.
  module Minions

    def self.new(name, food)
      instance_eval(<<-EOS, __FILE__, __LINE__ + 1)
        def #{name}
         #{food}
        end
      EOS
    end

  end

  ##
  # Creates minions for a specific controller
  # BTW extract_options rocks!!!
  class MinionCreator

    def initialize(name, *banana_potato_aaa)
      @name               = name.downcase
      @banana_potato_aaa  = banana_potato_aaa.extract_options!
      @actions            = banana_potato_aaa
      minion_create
    end

    def banana_potato_aaa
      @banana_potato_aaa
    end

    # :nodoc:
    private

    attr_reader :name, :actions

    def minion_create
      minions.new(name, digest_food)
    end

    def minions
      Minions
    end

    def digest_food
      {:actions => actions, :options => banana_potato_aaa}
    end

  end
end
