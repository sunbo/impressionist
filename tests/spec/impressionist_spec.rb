require 'minitest_helper'
require 'impressionist.rb'

describe Impressionist do

  # shortcut
  let(:imp) { Impressionist }

  describe '.setup' do
    it 'must respond_to' do
      imp.must_respond_to :setup
    end

    it 'must thown when no block is passed' do
      -> { imp.setup }.must_raise LocalJumpError
    end

    it 'must return Impressionist' do
      imp.setup { |c|
        c.must_equal imp
      }
    end

    it 'must respond to #orm' do
      imp.must_respond_to :orm
    end

    it ':active_record must be default value' do
      imp.orm.must_equal :active_record
    end

    it 'must change default orm' do
      # sets Imp.orm to active_record in order to
      # prevent broken tests as they're run randomly
      imp.orm = :mongoid
      imp.orm.must_equal :mongoid
      imp.orm = :active_record
    end

  end

  describe 'Creating minions' do

    it { imp.must_respond_to :minions }

    it { -> { imp.minions }.must_raise ArgumentError }

    it "must return self klass" do
      imp.minions {
        must_equal Impressionist
     } 
    end

    it { imp.must_respond_to :create }

    it "must receive name and options" do
      skip
      imp.create(:name, :actions, options: true).must_equal :created
    end

    it "must create a minion" do
      fake_food = Minitest::Mock.new
      fake_food.expect(:new, :created, [Symbol, Array])

      puts Impressionist.constants
      fake_minion_creator = MinionCreator.stub(:new, fake_food) do
        imp.create(:name, :actions, options: true)
        fake_food.verify
      end
    end

  end


end
