require_relative 'lib/phoenix_distributed_tracing/version'

Gem::Specification.new do |spec|
  spec.name          = "phoenix_distributed_tracing"
  spec.version       = PhoenixDistributedTracing::VERSION
  spec.authors       = ["Ravi Bhim"]
  spec.email         = ["ravi.bhim@yahoo.com"]

  spec.summary       = %q{Distributed Tracing for Phoenix}
  #spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "http://saasbox.com"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.2"

  # Using only opencesus for now
  #spec.add_dependency 'opentelemetry-api'
  #spec.add_dependency 'opentelemetry-sdk'
  #spec.add_dependency 'opentelemetry-exporters-jaeger'
  #spec.add_dependency 'opentelemetry-adapters-all'

  # Following line is not working. Have to install it in the app directly until a GA gem is out.
  #spec.add_dependency 'opentelemetry-adapters-mysql2', git: 'https://github.com/open-telemetry/opentelemetry-ruby', ref: 'e7361a21513fc6cee237a04b7260010bad42e885', glob: 'adapters/mysql2/*.gemspec'

  # Opencesnus can be removed once we have a rails adapter from opentelemetry-ruby
  spec.add_dependency 'opencensus'
  spec.add_dependency 'opencensus-jaeger'
end
