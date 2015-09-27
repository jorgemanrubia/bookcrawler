require 'test_helper'

class ClientTest < Minitest::Test
  def setup
    @crawler = Bookcrawler::Client.new
  end

  def test_find_by_title_returns_the_first_match_when_found
    VCR.use_cassette('test_find_by_title_returns_the_first_match_when_found') do
      book = @crawler.find_by_title('A Clash of Kings')
      assert_equal 'A Clash of Kings (A Song of Ice and Fire, Book 2)', book.title
    end
  end

  def test_find_by_title_returns_nil_when_not_found
    VCR.use_cassette('test_find_by_title_returns_nil_when_not_found') do
      assert_nil @crawler.find_by_title('thisbookdontexist')
    end
  end
end
