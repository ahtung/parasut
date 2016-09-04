# parasut-ruby

[![Build Status](https://travis-ci.org/ahtung/parasut-ruby.svg?branch=master)](https://travis-ci.org/ahtung/parasut-ruby)
[![Coverage Status](https://coveralls.io/repos/github/ahtung/parasut-ruby/badge.svg?branch=master)](https://coveralls.io/github/ahtung/parasut-ruby?branch=master)

You can sign up for an parasut account at https://www.parasut.com/

## Requirements

* Ruby 2.0.0 or newer

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'parasut'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install parasut

## Usage

Create an initializer for Parasut options.
```
    # config/initializers/parasut.rb
    Parasut.options do |o|
      o.client_id = 'client_id',
      o.client_secret = 'client_secret',
      o.username = 'username',
      o.password = 'password',
      o.grant_type = 'grant_type',
      o.redirect_uri = 'redirect_uri'
      o.company_id = 'company_id',
      o.authorize_url = 'authorize_url'
    end

````
TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ahtung/parasut-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
