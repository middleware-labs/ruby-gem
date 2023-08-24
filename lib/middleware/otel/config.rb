# frozen_string_literal: true

require 'opentelemetry/sdk'
require 'opentelemetry/sdk/resources/resource'

module Middleware
  module RubyGem
    module Otel

      class Config

        def self.init
          OpenTelemetry::SDK.configure do |c|
            c.resource=OpenTelemetry::SDK::Resources::Resource.create(
              'mw.app.lang' => 'ruby'
            )
            c.use_all
          end
        end

      end

    end
  end
end
