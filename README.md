# LtsvNg

[LTSV](http://ltsv.org/) logger for Ruby application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ltsv_ng'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ltsv_ng

## Usage

### for Rails

in `config/environments/production.rb`

```ruby
Rails.application.configure do

(snip)

  logger = LtsvNg::Logger.new(Rails.root.join("log/#{Rails.env}.log"))
  config.logger = logger

(snip)

end
```

### Sample log

```ruby
Rails.logger.info "foobar" # => level:INFO   time:2015-08-05 00:44:31 +0900  msg:foobar
Rails.logger.info id: 123, name: "alice" # => level:INFO   time:2015-08-05 00:46:56 +0900  id:123  name:alice
```

## Contributing

1. Fork it ( https://github.com/hirocaster/ltsv_ng/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
