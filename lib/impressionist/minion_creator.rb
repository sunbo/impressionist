##
# Minions are small, yellow, cylinder-shaped,
# creatures that have one or two eyes and they love
# Bananaaaa, Potato-naaaa!
#
# A minion is very smart,
# You create one by giving him a name and
# something to eat. ( banaaaa || potato )
#
# Impressionist.minion(:tom, [:actions], [:options])
#
# Impressionist.minions do |create|
#
#   SAAB = Same as above but
#
#   Given you have the first parameters as controllers name
#
#   # Logs an impression for any action, but doesn't update_counters
#   create(:papoy)
#
#   # SAAB for those three actions
#   create(:papoy, :a_toy, :show, :index)
#
#   # SAAB filters unique impressions, impression for action show
#   create(:papoy, :show, unique: :ip_address)
#
#   # SAAB but ...
#   create(:papoy, :show, unique: [:ip_address, :request_hash])
#
#   # Oh yeah SAAB updates counters now
#   # Minion tries to use its controller name as its Model name.
#   # However if you want to set a entity to update_counters
#   # You can do so by passing cache_in options
#
#   Given you have a Model named Papoy
#   And this model has a column_name impressions_total
#   And you can change this column_name by column_name: :my_own
#   When action show is requested
#   Then an impression will be saved
#
#   create(:papoy, :show, counter_cache => true)
#
#   # SAAB changes column name of Papoy to impressions
#   # default is impressions_total
#   create(:papoy, :show, counter_cache: true, column_name: :impressions)
#
#   # SAAB specifies a different entity 'class_name'
#   Given you have a controller that talks to a different Model
#   When you explicitly declare the model
#   Then an association should be set using that model
#
#   create(:papoy, :show,
#     counter_cache: true,
#     column_name: :impressions,
#     class_name: 'Poypa')
#
# end
# end

##
# Note: Impressionist makes associations on the fly
# By default it makes
# MyModel has_many :impressions, as: :impressionable ...
#
# If you're counter caching
# and you're using a separate entity to do so
# It will
# MyModel has_one :impressions_total, as: :impressions_cacheable ...
#
# See https://github.com/charlotte-ruby/impressionist/pull/100#issuecomment-22050432

module Impressionist

  ##
  # Creates a minion and feeds it
  # when MinionCreator tells it to.
  module Minions

    # :nodoc: Ruby 1.8.7 does not support define_singleton_method
    def self.new(name, food)
        define_singleton_method(name) { food }
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

    private

    attr_reader :name, :actions, :banana_potato_aaa

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
