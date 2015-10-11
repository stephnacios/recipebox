require 'spec_helper'
require 'rails_helper'

RSpec.describe Recipe::Create do
  let(:valid_form) { true }
  let(:form) do
    instance_double(Recipe::Form,
      :name                 => 'Chocolate Chip Cookies',
      :prep_time_in_minutes => 45,
      :servings             => 12,
      :ingredient           => 'Chocolate Chips',
      :valid?               => true,
    )
  end
  let(:use_case) { Recipe::Create.new(form) }
  subject(:perform) { use_case.perform }

  describe '#perform' do
    let(:recipe) { instance_double(Recipe, :add_ingredient => nil, :save! => nil) }
    let(:ingredient) { instance_double(Ingredient) }

    before do
      allow(Recipe).to receive(:new).and_return(recipe)
      allow(Ingredient).to receive(:find_or_create).with(:name => form.ingredient)
        .and_return(ingredient)
    end

    it 'creates a recipe with the form values' do
      expect(Recipe).to receive(:new).with(
        :name                 => form.name,
        :prep_time_in_minutes => form.prep_time_in_minutes,
        :servings             => form.servings
      )
      perform
    end

    it 'associates the ingredient with the recipe' do
      expect(recipe).to receive(:add_ingredient).with(ingredient)
      perform
    end

    it 'saves the recipe' do
      expect(recipe).to receive(:save!)
      perform
    end
  end

  describe '#success?' do
    context 'when the recipe was successfully created' do
      it 'returns true' do
        perform
        expect(use_case.success?).to be true
      end
    end

    context 'when the recipe was not successfully created' do
      let(:form) { Recipe::Form.new }

      before { allow(form).to receive(:valid?).and_return(false) }

      it 'returns false' do
        perform
        expect(use_case.success?).to be false
      end
    end
  end
end
