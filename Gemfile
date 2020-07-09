source "https://rubygems.org"

# Specify your gem's dependencies in phoenix_distributed_tracing.gemspec
gemspec

gem "rake", "~> 12.0"
gem "rspec", "~> 3.0"


# Using both opentelemetry and opencesus
gem 'opentelemetry-api'
gem 'opentelemetry-sdk'
gem 'opentelemetry-exporters-jaeger'
gem 'opentelemetry-adapters-all'

# Cutting edge - getting the gem from source ref. This need to be tracked and updated.
gem 'opentelemetry-adapters-mysql2', git: 'https://github.com/open-telemetry/opentelemetry-ruby', ref: 'e7361a21513fc6cee237a04b7260010bad42e885', glob: 'adapters/mysql2/*.gemspec'
# The below gem is WIP.
#gem 'opentelemetry-adapters-rails', git: 'https://github.com/martinisoft/opentelemetry-ruby', branch: 'add_rails_adapter', glob: 'adapters/rails/*.gemspec'

# Can you believe this? I'm using both opentelemetry and opencensus
gem 'opencensus'
gem 'opencensus-jaeger'
