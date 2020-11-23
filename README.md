# SP Test - Ruby
Sam Jenkins

## Setup
### Ruby version

This script was developed using Ruby version 2.7.2. I would advise installing this version before running the script.

### Bundler

`$ gem install bundler` to install bundler
`$ bundle` to install dependencies

### Running the script

`parser.rb` is only sensitive to the first command line argument. All other arguments will be ignored

Argument requirements:

- The filepath should be provided relative to the `ruby_app` directory.
Eg. the script can be run with the provided log file using `$ ruby ./parser.rb webserver.log`
- The filepath must include `.log`, else the programme will output an error message.

### Running the tests
I develop with a test-driven approach. The specs (and rubocop linter) I wrote can be run using the default rake command:
`$ rake`

## Additional documentation
- [Development decisions](./docs/development_decisions.md)
- [Stylistic choices](./docs/stylistic_choices.md)
