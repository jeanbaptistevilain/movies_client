# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'movies_client/version'

Gem::Specification.new do |spec|
  spec.name          = "movies_client"
  spec.version       = MoviesClient::VERSION
  spec.authors       = ["jeanbaptistevilain","SimonRonzani"]
  spec.email         = ["jbvilain@gmail.com","ronzani.simon@gmail.com"]
  spec.description   = "Small client that gathers data about movies using an input spreadsheet and the TMDB API"
  spec.summary       = "Parse ods file with roo, get information about movie from the TMDB API"
  spec.homepage      = "https://github.com/jeanbaptistevilain/movies_client"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"
  spec.add_development_dependency "shoulda"
  spec.add_runtime_dependency "roo"
  spec.add_runtime_dependency "spreadsheet", "1.0.0"
  spec.add_runtime_dependency "themoviedb", "0.0.24"
end
