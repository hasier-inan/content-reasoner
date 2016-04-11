# frozen_string_literal: true
require 'active_support/core_ext/object/blank'
require_relative '../exceptions/no_preference_name_error'

module Reasoner
  module Builder
    # A preference builder that uses a name to define a preference. Following versions may include negation and weight.
    class PreferenceBuilder
      include Exceptions

      def initialize
      end

      def name(name)
        @name = name
        self
      end

      def build
        raise NoPreferenceNameError if @name.blank?
        Preference.new(name: @name)
      end

      # An immutable preference object with a name to define it
      class Preference
        attr_reader :name

        def initialize(name:)
          @name = name
        end
      end
      private_constant :Preference
    end
  end
end
