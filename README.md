# Rubocop::EightyFourCodes

This is a collection of cops developed and used by 84codes AB

## Installation

Install the gem and add to the application's Gemfile by executing:

    bundle add rubocop-eightyfourcodes --require=false

If bundler is not being used to manage dependencies, install the gem by executing:

    gem install rubocop-eightyfourcodes

## Usage

You need to tell RuboCop to load the eightyfourcodes extension. There are three
ways to do this:

### RuboCop configuration file

Put this into your `.rubocop.yml`.

```yaml
require: rubocop-eightyfourcodes
```

Now you can run `rubocop` and it will automatically load the RuboCop eightyfourcodes
cops together with the standard cops.

To use the `eightyfourcodes` RuboCop config:

```yaml
inherit_gem:
  rubocop-eightyfourcodes: config/eightyfourcodes.yml
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

Use `bundle exec rake 'new_cop[EightyFourCodes/CommandLiteralInjection]'` to generate a new cop.

The [NodePattern Debugger](https://nodepattern.herokuapp.com/) is a very helpful resource when creating new AST matchers.


If you need to try out this gem in a project using it, before releasing a new version, you can do the following in the project:

```ruby
gem "rubocop-eightyfourcodes", **(ENV["LOCAL_RUBOCOP84"] ? { path: ENV["LOCAL_RUBOCOP84"] } : {})
```

Then try it like this:

```shell
LOCAL_RUBOCOP84=~/repos/rubocop-eightyfourcodes bundle install
LOCAL_RUBOCOP84=~/repos/rubocop-eightyfourcodes bundle exec rubocop
```

## Releasing

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version, update the version number in `version.rb`, in a commit or pull request.

Create and push a new signed git tag, the `git:tag` rake task will use the version from `version.rb`.

```shell
rake git:tag
git push --tags
```

This will trigger GitHub Actions to build and push the gem to [RubyGems.org](https://rubygems.org/gems/rubocop-eightyfourcodes).

If the release workflow fails, you can re-run it by deleting the tag and pushing it again.

```shell
git push --delete origin v<VERSION>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/84codes/rubocop-eightyfourcodes>.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
