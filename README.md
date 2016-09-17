# parasut

[![Build Status](https://travis-ci.org/ahtung/parasut.svg?branch=master)](https://travis-ci.org/ahtung/parasut)
[![Coverage Status](https://coveralls.io/repos/github/ahtung/parasut/badge.svg?branch=master)](https://coveralls.io/github/ahtung/parasut?branch=master)

You can sign up for an parasut account at https://www.parasut.com/

## Dependencies

- her
- kaminari

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
  require 'parasut'

  # config/initializers/parasut.rb
  Parasut.options do |option|
    option.client_id = 'client_id',
    option.client_secret = 'client_secret',
    option.username = 'username',
    option.password = 'password',
    option.company_id = 'company_id',
  end
```

Afterwards you can call a model:

    account = Parasut::Account.find(1)
    puts account.inspect

    contacts = Parasut::Contact.all
    puts contacts.inspect

    account.destroy


## ENVs

- PARASUT_CLIENT_ID
- PARASUT_CLIENT_SECRET
- PARASUT_USERNAME
- PARASUT_PASSWORD
- PARSUT_COMPANY_ID

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Test

    rspec

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ahtung/parasut. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
