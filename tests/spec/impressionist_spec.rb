require 'minitest_helper'
require 'impressionist.rb'

# TODO:
# Prevent colision of names when creating a
# minion ( duplicating it )
# by raising an exception.
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
      assert imp.create(:name, :actions, options: true)
    end

    it "must pass two actions" do
      imp.create(:papoy, :index, :show, counter_cache: :true)
      Impressionist::Minions.must_respond_to :papoy
    end

    it "must pass a lot of options" do
      imp.create(
        :papoy,
        :index, :show, :test, :another_action, :banana,
        counter_cache:  :true,
        column_name:    :my_name,
        unique:         true
      )

      Impressionist::Minions.must_respond_to :papoy
    end


  end


end
