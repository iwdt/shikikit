# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/iwdt/shikikit.

Pull requests will only be accepted if they meet all the following criteria:

1. Code must conform to the RuboCop rules. This can be verified with:
   ```bash
   bundle exec rake rubocop
   ```
1. 100% C0 code coverage. This can be verified with:
   ```bash
   bundle exec rake spec
   ```
1. RBS type signatures (in sig/**/*.rbs). This can be verified with:
   ```bash
   bundle exec rake steep
   ```
