require 'minitest_helper'
require 'impressionist/minion_creator'

module Impressionist
  describe MinionCreator do

    let(:minions) { Minions }

    it 'must creates a minion' do
      creator = MinionCreator.new(:tim)
      minions.must_respond_to :tim
    end

    it 'must have a downcase name' do
      creator = MinionCreator.new('Tim')
      minions.must_respond_to 'tim'
    end

    describe 'creates','and feeds' do

      it 'must take an controller action' do
        tim = MinionCreator.new(:tim, :index)
        minions.tim[:actions].must_equal [:index]
      end

      it 'must take multiple actions' do
        ben = MinionCreator.new(:ben, :index, :show, :edit)
        minions.ben[:actions].must_equal [:index, :show, :edit]
      end

      it 'must take options' do
        tom = MinionCreator.new(:tom, counter_cache: true)
        minions.tom[:options].must_equal counter_cache: true
        minions.tom[:options][:counter_cache].must_equal true
      end

      it 'must take multiple options' do
        feed = {
          counter_cache: true, column_name: :impressions,
          class_name: :Minion, unique: true
        }

        tob = MinionCreator.new(:tob, feed)
        minions.tob[:options].must_equal feed
      end

      it 'must have cache_in' do
        dan = MinionCreator.new(:dan, cache_in: :MyCacheCounter)
        minions.dan[:options][:cache_in].must_equal :MyCacheCounter
      end

      it 'must have class_name' do
        MinionCreator.new(:pen, class_name: :Model)
        minions.pen[:options][:class_name].must_equal :Model
      end

    end

  end
end
