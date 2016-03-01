# LtsvNg

[LTSV](http://ltsv.org/) logger for Ruby application.

[![Build Status](https://travis-ci.org/hirocaster/ltsv_ng.svg)](https://travis-ci.org/hirocaster/ltsv_ng)

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

in `config/environment.rb`

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
Rails.logger.info "foobar" # => level:INFO      time:2015-08-05 12:55:25 +0900  uuid:958125fc-4f35-4f45-9eef-046fece2dfc2       msg:foobar


Rails.logger.info id: 123, name: "alice" # => level:INFO      time:2015-08-05 12:56:03 +0900  uuid:26bd133e-94b2-450d-9ad5-1855c7649ccd       id:123  name:alice
```

## Contributing

1. Fork it ( https://github.com/hirocaster/ltsv_ng/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
