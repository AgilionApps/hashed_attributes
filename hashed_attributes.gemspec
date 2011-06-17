# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hashed_attributes/version"

Gem::Specification.new do |s|
  s.name        = "hashed_attributes"
  s.version     = HashedAttributes::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sean Behan"]
  s.email       = ["bseanvt@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Simple key/value store for attributes serialized in hash.}
  s.description = %q{This gem will let you extend active record}

  s.rubyforge_project = "hashed_attributes"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
