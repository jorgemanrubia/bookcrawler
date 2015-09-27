require 'ostruct'

module Bookcrawler
  class Book
    attr_accessor :title

    def initialize(properties)
      properties.each do |key, value|
        self.send("#{key}=", value)
      end
    end
  end
end
