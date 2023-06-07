require_relative "lib/importmap/version"

Gem::Specification.new do |spec|
  spec.name = "importmap"
  spec.version = Importmap::VERSION
  spec.authors = ["Tung Nguyen"]
  spec.email = ["tongueroo@gmail.com"]

  spec.summary = "Use ESM with importmap to manage modern JavaScript in Jets without transpiling or bundling."
  spec.homepage = "https://gitub.com/boltops-tools/importmap-jets"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.require_paths = ["lib"]
end
