require 'ostruct'
require 'vacuum'

module Bookcrawler
  class Client
    def find_by_title(title)
      entries = find_all_entries_by_title(title)
      target_entry = entries[0]

      if target_entry
        create_book_from_vacuum_entry(target_entry)
      else
        nil
      end
    end

    private

    def vacuum_client
      @vacuum_client ||= configure_vacuum_client
    end

    def configure_vacuum_client
      Vacuum.new.tap do |client|
        client.configure(
            associate_tag: ENV['AMAZON_ASSOCIATES_TRACKING_ID']
        )
      end
    end

    def find_all_entries_by_title(title)
      response = search_book_in_vacuum_by_title(title)

      results = response.to_h
      ['ItemSearchResponse', 'Items', 'Item'].each do |attribute_name|
        next unless results
        results = results[attribute_name]
      end
      results = [results] unless results.is_a?(Array)
      (results || []).collect { |result| vacuum_result_as_object(result) }
    end

    def search_book_in_vacuum_by_title(title)
      vacuum_client.item_search(
          query: {
              'Keywords' => title,
              'SearchIndex' => 'Books'
          }
      )
    end

    def vacuum_result_as_object(entry)
      attributes = entry['ItemAttributes']
      attributes.merge!('ASIN' => entry['ASIN'], 'DetailPageURL' => entry['DetailPageURL'])
      OpenStruct.new(attributes)
    end

    def create_book_from_vacuum_entry(target_entry)
      Book.new asin: target_entry['ASIN'],
               title: target_entry['Title'],
               author: process_author(target_entry['Author']),
               detail_page_url: target_entry['DetailPageURL']
    end

    def process_author(author_or_authors)
      [author_or_authors].flatten.join(', ')
    end
  end
end
