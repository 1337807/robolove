# Robolove

A simple wrapper for lego_nxt to drive Lego robots.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'robolove'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install robolove

## Usage

Create a new robot:

```
@bot = Robolove::Bot.new
```

Drive!

```
@bot.forward
```

## Contributing

1. Fork it ( https://github.com/1337807/robolove/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
