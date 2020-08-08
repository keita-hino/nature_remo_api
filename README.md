# NatureRemoApi

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/nature_remo_api`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nature_remo_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nature_remo_api

## Usage

Get an access token at the following site
https://developer.nature.global/

### setup
```ruby
NatureRemoApi::Client.configure do | config |
  config.access_token = <token>
end
```

### call API
```ruby
client = NatureRemoApi::Client.new

# get user info
client.user_me

# update user info
client.update_user_me(nickname: <nickname>)

# get devices
client.devices

# update device
client.update_device(device_id: <device_id>, name: <name>)

# get appliances
client.appliances

# get signals
client.signals(appliance_id: <appliance_id>)

# send signal to your appliances
client.send_signal(signal_id: <signal_id>)
```


TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nature_remo_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NatureRemoApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/nature_remo_api/blob/master/CODE_OF_CONDUCT.md).
