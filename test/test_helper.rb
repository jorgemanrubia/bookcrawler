$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bookcrawler'

require 'minitest/autorun'
require 'vcr'
require 'typhoeus'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.default_cassette_options = {
      match_requests_on: [:host, :path, :body, :headers, :method]
  }
  config.hook_into :webmock
end
