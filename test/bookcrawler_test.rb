require 'test_helper'

class BookcrawlerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Bookcrawler::VERSION
  end

end
