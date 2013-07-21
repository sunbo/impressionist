require 'minitest_helper'
require 'impressionist.rb'

describe Impressionist do

  # shortcut
  let(:imp) { Impressionist }

  describe "Setup config" do
    it "must respond_to #setup" do
      assert_respond_to imp, :setup
    end

    it "must returns self(imp)" do
      imp.setup { |c|
        assert_equal c, imp
      }
    end

    it "must respond to #orm puts 2" do
      assert_respond_to imp, :orm
    end

    it ":active_record must be default value" do
      assert_equal imp.orm, :active_record
    end

    it "must change default of orm" do
      # sets Imp.orm to active_record in order to
      # prevent broken tests as they're run randomly
      imp.orm = :mongoid
      assert_equal imp.orm, :mongoid
      imp.orm = :active_record
    end

  end

end
