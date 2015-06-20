require 'spec_helper'
require 'rails_helper'

RSpec.describe Measurement do
  subject(:measurement) do
    Measurement.create!(
      :name => 'cup',
    )
  end

  its(:name) { is_expected.to eq 'cup' }

  context 'when creating a duplicate Measurement' do
    it 'raises an exception' do
      expect {
        Measurement.create!(:name => 'cup')
        Measurement.create!(:name => 'cup')
      }.to raise_exception(ActiveRecord::RecordInvalid)
    end
  end
end
