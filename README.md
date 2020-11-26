# Rubybrainz

This is a wrapper for the [MusicBrainz API](https://musicbrainz.org/doc/MusicBrainz_API)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubybrainz'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubybrainz

## Usage
### Searching for an artist
Create an `ArtistParameter` object:

```
artist_parameter = Rubybrainz::Entities::Request::ArtistParameter.new(artist: 'madeon')
```

Call `Search.artist`

```
response = Rubybrainz::Search.new.artist(artist_parameter: artist_parameter)
```

Response will be an instance of `Rubybrainz::Entities::Response`. Since this was an artist query, 
we can 0 or more artists in the `.artists` field on the response.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/XanderRiga/rubybrainz. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rubybrainz project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rubybrainz/blob/master/CODE_OF_CONDUCT.md).
