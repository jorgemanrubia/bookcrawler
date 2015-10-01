require 'ostruct'

module Bookcrawler
  class Book
    attr_accessor :asin, :title, :author, :detail_page_url

    def initialize(properties)
      properties.each do |key, value|
        self.send("#{key}=", value)
      end
    end

    def cover_url
      #see http://aaugh.com/imageabuse.html
      "http://images.amazon.com/images/P/#{asin}.01.ZTZZZZZZ.jpg"
    end
  end
end
