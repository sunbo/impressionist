require 'minitest_helper'
require 'impressionist.rb'

describe Impressionist do

  describe "In order to setup config" do
    it "must respond_to #setup" do
      assert_respond_to Impressionist, :setup
    end

    it "must returns self(Impressionist)" do
      Impressionist.setup { |c|
        assert_equal c, Impressionist
      }
    end

    it "must respond to #orm puts 2" do
      assert_respond_to Impressionist, :orm
    end

    it ":active_record must be default value" do
      assert_equal Impressionist.orm, :active_record
    end

    it "must change default of orm" do
      Impressionist.orm = :mongoid
      assert_equal Impressionist.orm, :mongoid
    end

  end

end
