require 'minitest_helper'
require 'impressionist/orm/select_adapter.rb'

module Impressionist
module ORM

class ActiveRecord; end
class Mongoid; end

# Stubs rails root
def SelectAdapter.root
  File.expand_path('../../../../../lib', __FILE__)
end

describe SelectAdapter do

  parallelize_me!

  let(:s_a) { SelectAdapter }

  after(:each) { s_a.adapter = :active_record }

  it "must setup adapter's name" do
    s_a.adapter = :active_record
    s_a.adapter.must_equal :active_record
  end

  describe "reseting an adapter" do
  end

  it "must return an instance of an adapter" do
      s_a.reset_adapter_instance!
      s_a.adapter = :active_record

      s_a.adapter_instance_get.
        must_be_instance_of ActiveRecord
  end

  describe "a different adapter" do

    it "must be able to set a different adapter name" do
      s_a.adapter = :mongoid
      s_a.adapter.must_equal :mongoid
    end

    it "must be able to reset an adapter instance" do
      s_a.reset_adapter_instance!
      s_a.adapter = :mongoid

      s_a.adapter_instance_get.
        must_be_instance_of Mongoid
    end

  end

end
end
end
