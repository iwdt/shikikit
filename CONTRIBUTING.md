# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/iwdt/shikikit.

1. Fork it (https://github.com/iwdt/shikikit/fork)
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create a new Pull Request

Pull requests will only be accepted if they meet all the following criteria:

1. Code must conform to the RuboCop rules. This can be verified with:
   ```bash
   bundle exec rubocop
   ```
1. 100% C0 code coverage. This can be verified with:
   ```bash
   bundle exec rspec
   ```
1. RBS type signatures (in sig/**/*.rbs). This can be verified with:
   ```bash
   bundle exec steep check
   ```
