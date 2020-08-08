lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nature_remo_api/version"

Gem::Specification.new do |spec|
  spec.name          = "nature_remo_api"
  spec.version       = NatureRemoApi::VERSION
  spec.authors       = ["keita"]
  spec.email         = ["keitahino0415@gmail.com"]

  spec.summary       = %q{nature remo's api client}
  spec.homepage      = "https://github.com/keita-hino/nature-remo-ruby-client"
  spec.license       = "MIT"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday', '>= 1.0'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency "hashie"

  spec.add_dependency "bundler", "~> 2.0"
  spec.add_dependency "rake", "~> 13.0"
  spec.add_dependency "rspec", "~> 3.0"
end
