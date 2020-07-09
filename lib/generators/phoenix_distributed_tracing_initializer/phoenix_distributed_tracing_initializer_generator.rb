
require 'rails/all'

class PhoenixDistributedTracingInitializerGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc "This generator creates the phoenix_distributed_tracing initializer file at config/initializers."

    def create_phoenix_distributed_tracing_initializer
      initializer "phoenix_distributed_tracing" do <<~HEREDOC
# Content for the initializer
        HEREDOC
      end
    end
end
