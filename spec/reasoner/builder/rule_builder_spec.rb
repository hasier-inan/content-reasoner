# frozen_string_literal: true
require 'reasoner/builder/rule_builder'
require 'reasoner/builder/preference_builder'
require 'reasoner/exceptions/no_preferences_error'
require 'reasoner/exceptions/no_result_error'

describe Reasoner::Builder::RuleBuilder do
  let(:rule_builder) { described_class.new }
  let(:preference_one) { Reasoner::Builder::PreferenceBuilder.new.name(:first_preference).build }
  let(:preference_two) { Reasoner::Builder::PreferenceBuilder.new.name(:second_preference).build }
  let(:result_one) { Reasoner::Builder::PreferenceBuilder.new.name(:first_result).build }
  let(:result_two) { Reasoner::Builder::PreferenceBuilder.new.name(:second_result).build }

  context 'builder is used to initialise rule' do
    it 'includes specified preferences' do
      rule = build_a_rule(preference_one, preference_two, result_one)
      expect(rule.preferences).to include(preference_one, preference_two)
    end

    it 'sets a result' do
      rule = build_a_rule(preference_one, preference_two, result_one)
      expect(rule.result).to be(result_one)
    end

    def build_a_rule(preference_one, preference_two, result)
      rule_builder
        .add_preference(preference_one)
        .add_preference(preference_two)
        .result(result)
        .build
    end
  end

  context 'builder requires mandatory objects' do
    it 'can not build a rule without setting at least one preference' do
      expect do
        rule_builder
          .result(result_one)
          .build
      end.to raise_error(Reasoner::Exceptions::NoPreferencesError)
    end

    it 'can not build a rule without setting a result' do
      expect do
        rule_builder
          .add_preference(preference_one)
          .add_preference(preference_two)
          .build
      end.to raise_error(Reasoner::Exceptions::NoResultError)
    end

    it 'sets a unique result' do
    end
  end
end
