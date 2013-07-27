require 'minitest_helper'
require 'impressionist/middleware'

module Impressionist
  describe Middleware do

    let(:mw) { Middleware.new("app") }

    describe '#initialize' do
      it "must initialize passing app" do
        assert mw
      end

      it "must set @app variable" do
        app = mw.instance_variable_get(:@app)
        assert_equal "app", app
      end

    end

    describe '#call' do
      it { assert_respond_to mw, :call }

      it "must call #call on app" do
        mock  = Minitest::Mock.new
        mock.expect(:call, true, [String])

        mw    = Middleware.new(mock)

        assert mw.call("env")
        mock.verify
      end
    end

  end
end
