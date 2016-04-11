# frozen_string_literal: true
require 'reasoner/builder/preference_builder'
require 'reasoner/exceptions/no_preference_name_error'

describe Reasoner::Builder::PreferenceBuilder do
  let(:preference_name) { :first_preference }
  let(:preference_builder) { described_class.new }

  context 'builder is used to initialise preference' do
    it 'includes specified name' do
      expect(preference_builder
                 .name(preference_name)
                 .build.name).to be(preference_name)
    end
  end

  context 'builder requires mandatory objects' do
    it 'can not build a result without setting a preference' do
      expect do
        preference_builder
          .build
      end.to raise_error(Reasoner::Exceptions::NoPreferenceNameError)
    end
  end
end
