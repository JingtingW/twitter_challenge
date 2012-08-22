# -*- encoding: utf-8 -*-
require File.expand_path('../lib/twitter_challenge/version', __FILE__)


Gem::Specification.new do |gem|
  gem.authors       = ["Jingting Wang"]
  gem.email         = ["jtwanggwu@gmail.com"]
  gem.description   = %q{Code challenge for Square, print the most frequently used words.}
  gem.summary       = %q{Code challenge for Square}
  gem.homepage      = "https://github.com/JingtingW/twitter_challenge"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "twitter_challenge"
  gem.require_paths = ["lib"]
  gem.version       = TwitterChallenge::VERSION

  # We need the twitter gem
  gem.add_dependency "twitter"
end
