# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bootstrap-form/version"

Gem::Specification.new do |s|
  s.name        = "bootstrap-form"
  s.version     = Bootstrap::Form::VERSION
  s.authors     = ["David Padilla"]
  s.email       = ["david@crowdint.com"]
  s.homepage    = ""
  s.summary     = %q{Twitter Bootstrap Form helpers}
  s.description = %q{Twitter Bootstrap Form helpers}

  s.rubyforge_project = "bootstrap-form"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]


  s.add_dependency 'railties', '~> 3.0'
  s.add_dependency 'actionpack', '~> 3.0'

  s.add_development_dependency "minitest"
  s.add_development_dependency "rr"
end
