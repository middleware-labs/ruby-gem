# frozen_string_literal: true

require_relative '../logger'

require "uri"
require "net/http"
require 'json'
require "logger"


module Middleware
  module RubyGem
    module Auth

      class Authentication

        @response = nil

        def get_response
          @response
        end
        def auth
          mw_api_key = ENV["MW_API_KEY"]
          if mw_api_key == nil
            MwLogger.warn("Profiling is not initialized as MW_API_KEY is not provided")
            return false
          end

          url = URI("https://app.stage.env.middleware.io/api/v1/auth")

          https = Net::HTTP.new(url.host, url.port)
          https.use_ssl = true

          request = Net::HTTP::Post.new(url)
          request["Content-Type"] = "application/x-www-form-urlencoded"
          request["Authorization"] = "Bearer #{mw_api_key}"

          response = https.request(request)

          body = JSON.parse(response.body)
          success_value = body['success']

          if success_value
            @response = body
          else
            MwLogger.warn("Profiling is not initialized as authentication is failed")
          end

          success_value
        end

      end

    end
  end
end
