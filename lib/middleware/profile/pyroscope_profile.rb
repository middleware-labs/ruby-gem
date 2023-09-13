# frozen_string_literal: true

require_relative '../auth/authentication'
require_relative '../logger'
require "pyroscope"

module Middleware
  module RubyGem
    module Profile

      class PyroscopeProfile

        def self.init
          authentication = Auth::Authentication.new
          return unless authentication.auth

          Pyroscope.configure do |config|
            config.application_name = ENV["OTEL_SERVICE_NAME"] || "default-service-name"
            config.server_address = ENV["MW_PROFILING_SERVER_URL"] || "https://profiling.middleware.io"
            config.tenant_id = authentication.get_response['data']['account']
          end

          MwLogger.info("Profiling started")
        end

      end

    end
  end
end