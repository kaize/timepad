# -*- encoding: utf-8 -*-
require File.expand_path('../lib/timepad/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrey Subbota"]
  gem.email         = ["subbota@gmail.com"]
  gem.description   = %q{Gem that provide access to timepad.ru api}
  gem.summary       = %q{See description}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split("\n")
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "timepad"
  gem.require_paths = ["lib"]
  gem.version       = Timepad::VERSION
end
