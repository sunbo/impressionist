require 'minitest_helper'
require 'impressionist/minions'

module Impressionist
  describe MinionCreator do

    describe 'creating one' do

      let(:minion) { MinionCreator.new('tim') }

      it { minion.name.must_equal 'tim' }

      it 'must have a downcase name' do
        minion = MinionCreator.new('Tim')
        minion.name.must_equal 'tim'
      end

      describe 'something to eat' do

        it 'must pass an controller action' do
          minion = MinionCreator.new('tim', :banana)
          minion.banana_potato_aaa.must_equal [:banana]
        end

        it 'must have more specs'

      end

      describe 'creates one minion' do
        let(:minion) { MinionCreator.new(:papoy) }

        it { minion.minions.must_respond_to :papoy }

        it { minion.minions.papoy.must_be_nil }

        it 'must have more specs'
      end

    end

  end
end
