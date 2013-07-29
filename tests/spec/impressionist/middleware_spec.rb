require 'minitest_helper'
require 'impressionist/middleware'
require 'rack/test'

module Impressionist
  describe Middleware do

    let(:mw) { Middleware.new("app") }

    describe '#initialize' do
      it "must take one arg" do
        mw.must_be_instance_of Middleware
      end

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

    describe Middleware, 'with PageResponse' do

      it "" do
      end

    end

    # see http://blog.kesor.net/2012/06/05/rack-middleware/
    describe Middleware, 'in use' do
      include Rack::Test::Methods

      describe '200' do
        # rack calls requires this
        let(:request) {
          ->(env) { [200, { 'Content-type' => 'text/plain' }, ['body'] ] }
        }
        let(:app) { Middleware.new(request) }

        before { get '/' }

        subject { last_response }

        it { subject.status.        must_equal 200 }
        it { subject.body.          must_equal 'body' }
        it { subject.content_length.must_equal 4 }
        it { subject.content_type.  must_equal 'text/plain' }
      end

    end

  end
end
