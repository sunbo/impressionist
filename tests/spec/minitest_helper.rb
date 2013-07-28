require 'minitest/autorun'
require 'minitest/pride'
require 'active_support/core_ext/module/attribute_accessors'

# Impressionist tests are awesome
# and so we run them in parallel
Minitest::Unit::TestCase.parallelize_me!

# Fake Rails::Engine
module Rails
  class Engine
    def self.isolate_namespace(x)
      true
    end

  end
end

