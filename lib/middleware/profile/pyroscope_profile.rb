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
            config.application_name = "test.mw.app"
            config.server_address = "https://profiling.stage.env.middleware.io"
            config.tenant_id = authentication.get_response['data']['account']
          end

          MwLogger.info("Profiling started")
        end

      end

    end
  end
end