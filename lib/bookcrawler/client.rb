require 'ostruct'
require 'vacuum'

module Bookcrawler
  class Client
    def find_by_title(title)
      entries = find_all_entries_by_title(title)
      target_entry = entries[0]

      if target_entry
        Book.new(title: target_entry['Title'])
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
            aws_access_key_id: 'AKIAI6UFMJZZXGACVVGQ',
            aws_secret_access_key: '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',
            associate_tag: 'jorgmanrpersp-20'
        )
      end
    end

    def find_all_entries_by_title(title)
      response = search_book_in_vacuum_by_title(title)

      entries = response.to_h
      ['ItemSearchResponse', 'Items', 'Item'].each do |attribute_name|
        next unless entries
        entries = entries[attribute_name]
      end

      (entries || []).collect { |entry| entry_as_object(entry) }
    end

    def search_book_in_vacuum_by_title(title)
      vacuum_client.item_search(
          query: {
              'Keywords' => title,
              'SearchIndex' => 'Books'
          }
      )
    end

    def entry_as_object(entry)
      OpenStruct.new(entry['ItemAttributes'])
    end

  end
end
