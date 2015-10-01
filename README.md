# Bookcrawler

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bookcrawler'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bookcrawler

## Usage

Set your [Amazon credentials](https://affiliateprogram.amazon.com/gp/flex/advertising/api/sign-in.html) as env vars:

```
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...
export AMAZON_ASSOCIATES_TRACKING_ID=...
```

Find a book:

```ruby
crawler = Bookcrawler::Client.new
book = crawler.find_by_title('A Clash of Kings')

# <Bookcrawler::Book:
    asin: "0553579908",
    title: "A Clash of Kings (A Song of Ice and Fire, Book 2)",
    author: "George R. R. Martin",
    detail_page_url: "http://...",
    cover_url: "http://...">
```

You can fetch the book cover from `cover_url`. Support for covers is not official in the [Amazon Product Advertising API](https://affiliate-program.amazon.com/gp/advertising/api/detail/main.html). The url is generated according to [this article](http://aaugh.com/imageabuse.html).

This gem uses [Vacuum](https://github.com/hakanensari/vacuum) under the hood.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

