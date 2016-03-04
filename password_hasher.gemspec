# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'password_hasher/version'

Gem::Specification.new do |spec|
  spec.name          = "password_hasher"
  spec.version       = PasswordHasher::VERSION
  spec.authors       = ["Taylor Hornby"]
  spec.email         = ["havoc AT defuse.ca "]

  spec.summary       = %q{Simple password hashing library.}
  spec.description   = %q{This gem was made from a preexisting library.  I did not write the code.  I just made it a gem so I could share it between projects.}
  spec.homepage      = "https://github.com/riggleg/password_hasher"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
