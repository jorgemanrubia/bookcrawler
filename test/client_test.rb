require 'test_helper'

class ClientTest < Minitest::Test
  def setup
    @crawler = Bookcrawler::Client.new
  end

  def test_find_by_title_returns_the_first_match_when_found
    VCR.use_cassette('test_find_by_title_returns_the_first_match_when_found') do
      book = @crawler.find_by_title('A Clash of Kings')
      assert_equal '0553579908', book.asin
      assert_equal 'A Clash of Kings (A Song of Ice and Fire, Book 2)', book.title
      assert_equal 'George R. R. Martin', book.author
      assert_equal 'http://www.amazon.com/Clash-Kings-Song-Fire-Book/dp/0553579908%3FSubscriptionId%3DAKIAIS2UFY7HEGKAYAWQ%26tag%3Djorgmanrpersp-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0553579908', book.detail_page_url
    end
  end

  def test_find_by_title_returns_nil_when_not_found
    VCR.use_cassette('test_find_by_title_returns_nil_when_not_found') do
      assert_nil @crawler.find_by_title('thisbookdontexist')
    end
  end
end
