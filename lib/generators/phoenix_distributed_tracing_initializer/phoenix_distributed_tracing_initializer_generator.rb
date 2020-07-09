
require 'rails/all'

class PhoenixDistributedTracingInitializerGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc "This generator creates the phoenix_distributed_tracing initializer file at config/initializers."

    def create_phoenix_distributed_tracing_initializer
      initializer "phoenix_distributed_tracing.rb" do <<~HEREDOC

require 'opentelemetry/sdk'
require 'opentelemetry/exporters/jaeger'

# Configure the sdk with custom export
OpenTelemetry::SDK.configure do |c|
  c.add_span_processor(
    OpenTelemetry::SDK::Trace::Export::SimpleSpanProcessor.new(
      OpenTelemetry::Exporters::Jaeger::Exporter.new(
        service_name: Rails.application.class.module_parent_name,
        host: ENV['JAEGER_HOST'],
        port: ENV['JAEGER_PORT']
      )
    )
  )

  # Which adapters to use?
  c.use_all
end

OpenCensus.configure do |c|
  c.trace.exporter = OpenCensus::Trace::Exporters::JaegerExporter.new(
    service_name: Rails.application.class.module_parent_name,
    host: ENV['JAEGER_HOST'],
    port: ENV['JAEGER_PORT'],
    #max_packet_length: 12345, # config if you want something smaller than DEFAULT_MAX_LENGTH,
    protocol_class: ::Thrift::CompactProtocol # currently supporting only compact protocol
  )
end

        HEREDOC
      end
    end
end
