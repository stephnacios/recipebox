require 'spec_helper'
require 'rails_helper'

RSpec.describe Recipe do
  let(:name) { 'Roast Chicken' }
  let(:prep_time_in_minutes) { 60 }
  let(:servings) { 4 }

  subject(:recipe) do
    Recipe.create!(
      :name                 => name,
      :prep_time_in_minutes => prep_time_in_minutes,
      :servings             => servings,
    )
  end

  its(:name) { is_expected.to eq name }
  its(:prep_time_in_minutes) { is_expected.to eq prep_time_in_minutes }
  its(:servings) { is_expected.to eq servings }

  describe '#add_ingredient' do
    let(:ingredient) { Ingredient.new(:name => 'Banana') }
    let(:recipe_ingredient) { RecipeIngredient.new }

    before do
      allow(RecipeIngredient).to receive(:new).with(:ingredient => ingredient)
        .and_return(recipe_ingredient)
    end

    it 'associates the ingredient with the recipe' do
      recipe.add_ingredient(ingredient)
      expect(recipe.recipe_ingredients).to include(recipe_ingredient)
    end
  end
end
