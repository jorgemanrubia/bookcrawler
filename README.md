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

Set your [Amazon credentials](https://affiliate-program.amazon.com/gp/flex/advertising/api/sign-in.html) as env vars:

```
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...
export AMAZON_ASSOCIATES_TRACKING_ID=...
```

Find a book:

```ruby
crawler = Bookcrawler::Client.new
book = @crawler.find_by_title('A Clash of Kings')
```

This gem uses [Vacuum](https://github.com/hakanensari/vacuum) under the hood.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

