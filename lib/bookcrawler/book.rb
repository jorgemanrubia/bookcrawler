require 'ostruct'

module Bookcrawler
  class Book
    attr_accessor :asin, :title, :author, :detail_page_url

    def initialize(properties)
      properties.each do |key, value|
        self.send("#{key}=", value)
      end
    end
  end
end
