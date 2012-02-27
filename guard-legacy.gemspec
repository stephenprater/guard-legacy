# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard-legacy/version"

Gem::Specification.new do |s|
  s.name        = "guard-legacy"
  s.version     = Guard::Legacy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Stephen Prater"]
  s.email       = ["me@stephenprater.com"]
  s.homepage    = ""
  s.summary     = %q{use the rb-fsevents-legacy gem for Guard::Darwin}
  s.description = %q{compatibility layer for legacy systems with Guard}

  s.rubyforge_project = "guard-legacy"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'guard'
  s.add_dependency 'rb-fsevent-legacy'
end
