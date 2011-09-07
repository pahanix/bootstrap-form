# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bootsrap-form/version"

Gem::Specification.new do |s|
  s.name        = "bootsrap-form"
  s.version     = Bootsrap::Form::VERSION
  s.authors     = ["David Padilla"]
  s.email       = ["david@crowdint.com"]
  s.homepage    = ""
  s.summary     = %q{Twitter Bootstrap Form helpers}
  s.description = %q{Twitter Bootstrap Form helpers}

  s.rubyforge_project = "bootsrap-form"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
