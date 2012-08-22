# TwitterChallenge

The code is in lib/

Tests locate in spec/

Run the rspec tests for the gem:

    $ rspec spec/

Example is in bin/


## Installation
Build the gem:

    $ gem build twitter_challenge.gemspec

Add this line to your application's Gemfile:

    gem 'twitter_challenge'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install twitter_challenge-0.0.1.gem

## Usage

    require 'twitter_challenge'

    printer = TwitterChallenge::Square.new
    words = printer.get_words_by_frequency(ARGV[0])

    words.each do |word|
      puts "#{word[:word]}, #{word[:freq]}"
    end

Or see the example in bin/ folder


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
