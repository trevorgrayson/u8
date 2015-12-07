require File.expand_path("../lib/u8/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name    = 'u8'
  gem.version = U8::VERSION
  gem.date    = Date.today.to_s

  gem.summary = "Eval-U8 BASH commands in clean ruby"
  gem.description = "Run shell commands with models instead of running strings"

  gem.authors  = ["Trevor Grayson"]
  gem.email    = 'trevor@ipsumllc.com'
  gem.homepage = 'http://github.com/trevorgrayson/u8'

  gem.add_dependency('rake')
  gem.add_development_dependency('rspec', [">= 2.0.0"])

  # ensure the gem is built out of versioned files
  gem.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
end
