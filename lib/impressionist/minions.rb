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
# Impressionist.minions do |new|
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
#   create(:papoy, :show,
#     counter_cache => {:column_name: :impressions, entity: 'Poypa'})
#
# Becomes:
# define_method :papoy do
#   Hash os options passed to when creating a new minion
#   banana_potato_aaa
# end
# end

module Impressionist

  module Minions

    def self.new(name)
      instance_eval(<<-EOS, __FILE__, __LINE__ + 1)
        def #{name}
        end
      EOS
    end

  end

  class MinionCreator

    attr_reader :name, :minions

    def initialize(name, *banana_potato_aaa)
      @name               = name.downcase
      @banana_potato_aaa  = banana_potato_aaa
      @minions            = Minions
      minion_create
    end

    def banana_potato_aaa
      @banana_potato_aaa
    end

    private

    def minion_create
      minions.new(name)
    end

  end
end
