require 'minitest/autorun'
require 'minitest/pride'

require 'active_support/core_ext/module/attribute_accessors'

require 'active_support/core_ext/string/inflections.rb'
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

