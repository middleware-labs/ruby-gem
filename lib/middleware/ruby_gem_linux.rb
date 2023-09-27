# frozen_string_literal: true

require_relative "ruby_gem/version"
require_relative 'otel/config'
require_relative 'profile/pyroscope_profile'

module Middleware
  module RubyGem
    class Error < StandardError; end

    def self.init
      Otel::Config.init
      Profile::PyroscopeProfile.init
    end

  end
end
