require 'minitest_helper'
require 'impressionist/response_monster'

module Impressionist

  describe ResponseMonster do

    let(:rm) { ResponseMonster.new("any response") }

    it "must initialize" do
      rm.must_be_instance_of ResponseMonster
    end

    it "creates an instance of Pool" do
      rm.minions.must_be_instance_of Module
    end

    describe '.call' do

      subject { ResponseMonster }

      it { subject.must_respond_to :call }

      it {
        expected = [{:a => 2}, [2]]
        rm = subject.call(expected)
        rm.response.must_equal expected
      }

    end

  end
end
