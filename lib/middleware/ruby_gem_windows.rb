# frozen_string_literal: true

require_relative "ruby_gem/version"
require_relative 'otel/config'

module Middleware
  module RubyGem
    class Error < StandardError; end

    def self.init
      Otel::Config.init
    end

  end
end
