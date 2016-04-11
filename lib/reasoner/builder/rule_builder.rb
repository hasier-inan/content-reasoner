# frozen_string_literal: true
require 'active_support/core_ext/object/blank'
require_relative '../exceptions/no_preferences_error'
require_relative '../exceptions/no_result_error'

module Reasoner
  module Builder
    # An rule builder that sets one or more preferences and a result. Following versions may include rule
    # weights.
    class RuleBuilder
      include Exceptions

      def initialize
        @preference_set = []
      end

      def add_preference(preference)
        @preference_set << preference
        self
      end

      def result(result)
        @result = result
        self
      end

      def build
        raise NoPreferencesError if @preference_set.empty?
        raise NoResultError if @result.blank?
        Rule.new(preferences: @preference_set, result: @result)
      end

      # An immutable rule object with a set of preferences and a result
      class Rule
        attr_reader :preferences, :result

        def initialize(preferences:, result:)
          @preferences = preferences
          @result = result
        end
      end
      private_constant :Rule
    end
  end
end
