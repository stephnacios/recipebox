require 'spec_helper'
require 'rails_helper'

RSpec.describe Ingredient do
  subject(:ingredient) do
    Ingredient.create!(
      :name => 'Butter',
    )
  end

  its(:name) { is_expected.to eq 'Butter' }

  context 'when creating a duplicate ingredient' do
    it 'raises an exception' do
      expect {
        Ingredient.create!(:name => 'Butter')
        Ingredient.create!(:name => 'Butter')
      }.to raise_exception(ActiveRecord::RecordInvalid)
    end
  end
end
