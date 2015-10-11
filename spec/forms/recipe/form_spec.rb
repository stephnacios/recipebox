require 'spec_helper'
require 'rails_helper'

RSpec.describe Recipe::Form, :type => :model do
  let(:name) { 'Roast Chicken' }
  let(:prep_time_in_minutes) { 45 }
  let(:servings) { 6 }
  let(:ingredient) { 'Whole Chicken' }
  let(:params) do
    {
      :name                 => name,
      :prep_time_in_minutes => prep_time_in_minutes,
      :servings             => servings,
      :ingredient           => ingredient,
    }
  end

  subject(:form) { Recipe::Form.new(params)}

  describe '#valid?' do
    context 'when all parameters are valid' do
      it 'returns true' do
        expect(form.valid?).to be true
      end
    end

    context 'when name is not provided' do
      let(:name) { nil }
      it 'returns false' do
        expect(form.valid?).to be false
      end
    end

    context 'when prep_time_in_minutes is not provided' do
      let(:prep_time_in_minutes) { nil }
      it 'returns false' do
        expect(form.valid?).to be false
      end
    end

    context 'when servings is not provided' do
      let(:servings) { nil }
      it 'returns false' do
        expect(form.valid?).to be false
      end
    end

    context 'when an ingredient is not provided' do
      let(:ingredient) { nil }
      it 'returns false' do
        expect(form.valid?).to be false
      end
    end
  end

end
