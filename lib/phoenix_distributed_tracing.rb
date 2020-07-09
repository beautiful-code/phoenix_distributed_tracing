require "phoenix_distributed_tracing/version"

require 'opentelemetry-adapters-all'
require 'opencensus-jaeger'

module PhoenixDistributedTracing
  class Error < StandardError; end
  # Your code goes here...
end

# Spanning all controller action calls
ActionController::API.class_eval do

  around_action :wrap_in_opentelemetry_span

  def wrap_in_opentelemetry_span
    tracer = OpenTelemetry.tracer_provider.tracer()
    tracer.in_span('contoller action') do |span|
      span.set_attribute('controller:action', "#{params[:controller]}:#{params[:action]}")
      span.set_attribute('debug', 'true') if params[:debug].present?
      yield
    end
  end
end
