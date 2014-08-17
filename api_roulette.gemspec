lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name        = 'api_roulette'
  spec.version     = '0.0.1'
  spec.date        = '2014-08-16'
  spec.summary     = "Get random APIs from ProgrammableWeb.com"
  spec.description = "Scrapes API titles, links, categories and descriptions from a pecpage of ProgrammableWeb.com, or provides a given quantity of random APIs"
  spec.authors     = ["James Robinson"]
  spec.email       = 'james.michael.robinson@gmail.com'
  spec.files       = ["lib/api_roulette.rb"]
  spec.homepage    = 'http://rubygems.org/gems/api_roulette'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
