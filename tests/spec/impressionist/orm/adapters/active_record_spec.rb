require 'minitest_helper'
require 'active_support/concern'
require 'impressionist/orm/adapters/active_record'

# I don't like writing true all the time
class BasicObject
    def must_be_true; must_equal(true); end
end

module Impressionist
module ORM

  describe Adapters::ActiveRecord do

    class Dummy
      include Adapters::ActiveRecord

      class << self
        # In order to test each method
        # As we're testing against Ruby's Class(!Instance)
        # As some methods should not be public
        # We have to make them public
        # Don't know about Ruby's self?
        # Check this out: http://yugui.jp/articles/846
        public(:must_have_many, :must_belong_to)

        # Stubs AR
        def has_many(name, options); true; end
        def belongs_to(name, options); true; end

        def find(params)
          true
        end

      end
    end

    let(:a_r) { Dummy }

    describe "must_have_many" do
      it { a_r.must_respond_to :must_have_many }

      it "must have a name" do
        a_r.must_have_many(:impressions).must_be_true
      end

      it "must take some options" do
        a_r.must_have_many(:impressions, {}).must_be_true
      end
    end

    describe "#must_belong_to" do
      it { a_r.must_respond_to :must_belong_to }
      it "must have a name" do
        a_r.must_belong_to(:ruby_rocks).must_be_true
      end

      it "must take some options" do
        a_r.must_belong_to(:banana, {}).must_be_true
      end
    end

    describe "Handling impressions" do
      it { a_r.must_respond_to :impression_exist? }
      it { a_r.impression_exist?.must_be_true     }

      it "must be changed for where, limit"
      it { a_r.must_respond_to :find_an_impression    }
      it { a_r.find_an_impression({}).must_be_true    }
    end

    describe "Update Counters Cache" do
      it { a_r.must_respond_to :must_update_counter }
    end

  end
end
end
