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
          account = authentication.get_response['data']['account']
          Pyroscope.configure do |config|
            config.application_name = ENV["OTEL_SERVICE_NAME"] || "default-service-name"
            config.server_address = ENV["MW_PROFILING_SERVER_URL"] || "https://#{account}.middleware.io/profiling"
            config.tenant_id = account
          end

          MwLogger.info("Profiling started")
        end

      end

    end
  end
end