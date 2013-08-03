require 'minitest_helper'
require 'impressionist/middleware'

module Impressionist
  describe Middleware do

    let(:mw) { Middleware.new("app") }

    describe '#initialize' do
      it { mw.must_be_instance_of Middleware }

      it "must set @app variable" do
        at_app = mw.instance_variable_get(:@app)
        at_app.must_equal "app"
      end

    end

    describe '#call' do

      it { mw.must_respond_to :call }

      it "must call #call on app" do
        request  = Minitest::Mock.new
        request.expect(:call, true, [String])

        mw    = Middleware.new(request)

        mw.call("env").must_equal true
        request.verify
      end

    end

  end
end
