# frozen_string_literal: true

require 'logger'

module Middleware
  module RubyGem

    class MwLogger

      @@logger = Logger.new(STDOUT)

      def self.debug(message)
        @@logger.debug(message)
      end

      def self.error(message)
        @@logger.error(message)
      end

      def self.info(message)
        @@logger.info(message)
      end

      def self.warn(message)
        @@logger.warn(message)
      end

    end

  end
end