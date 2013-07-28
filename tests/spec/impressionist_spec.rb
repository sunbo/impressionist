require 'minitest_helper'
require 'impressionist.rb'

describe Impressionist do

  parallelize_me!

  # shortcut
  let(:imp) { Impressionist }

  describe "Setup config" do
    it "must respond_to #setup" do
      imp.must_respond_to :setup
    end

    it "must thown when no block is passed" do
      -> { imp.setup }.must_raise LocalJumpError
    end

    it "must return Impressionist" do
      imp.setup { |c|
        c.must_equal imp
      }
    end

    it "must respond to #orm" do
      imp.must_respond_to :orm
    end

    it ":active_record must be default value" do
      imp.orm.must_equal :active_record
    end

    it "must change default orm" do
      # sets Imp.orm to active_record in order to
      # prevent broken tests as they're run randomly
      imp.orm = :mongoid
      imp.orm.must_equal :mongoid
      imp.orm = :active_record
    end

  end

end
