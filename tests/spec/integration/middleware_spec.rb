ENV["RAILS_ENV"] = "test"
require 'minitest_helper'
require 'impressionist/middleware'
require 'active_support/notifications'
require 'rack/test'

# see http://blog.kesor.net/2012/06/05/rack-middleware/

module Impressionist
describe Middleware, 'in use' do

  include ::Rack::Test::Methods

  describe 'a request' do
    let(:request) {
      -> (env) {
        [200, { 'Content-type' => 'text/plain' }, ['body'] ]
      }
    }

    let(:app) { Middleware.new(request) }

    before { get '/' }

    it { last_response.status.        must_equal 200 }
    it { last_response.body.          must_equal 'body' }
    it { last_response.content_length.must_equal 4 }
    it { last_response.content_type.  must_equal 'text/plain' }

  end

  describe 'feeding ResponseMonster' do
    it { skip 'implement RM' }
  end

end
end


