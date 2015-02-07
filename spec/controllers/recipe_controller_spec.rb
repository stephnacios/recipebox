require 'rails_helper'

RSpec.describe RecipeController, type: :controller do

  describe '#new' do
    it 'initializes a blank recipe' do
      expect(Recipe).to receive(:new)
      get :new
    end
  end

  describe '#index' do
    it 'retrieves all recipes' do
      expect(Recipe).to receive(:all)
      get :index
    end
  end

  describe '#show' do
    let(:id) { 12345 }

    it 'retrieves the recipe with the given ID' do
      expect(Recipe).to receive(:find_by_id).with(id)
      get :show, :id => id
    end
  end

  describe '#create' do
    let(:name) { 'Roast Chicken' }
    let(:prep_time_in_minutes) { '60' }
    let(:servings) { '4' }
    let(:recipe) { instance_double(Recipe, :save => nil) }
    let(:recipe_params) do
      {
        'name'                 => name,
        'prep_time_in_minutes' => prep_time_in_minutes,
        'servings'             => servings
      }
    end

    before do
      allow(Recipe).to receive(:new).and_return(recipe)
    end

    it 'initializes a recipe with given parameters' do
      expect(Recipe).to receive(:new).with(
        'name'                 => name,
        'prep_time_in_minutes' => prep_time_in_minutes,
        'servings'             => servings,
      )
      post :create, :recipe => recipe_params
    end

    it 'saves the recipe' do
      expect(recipe).to receive(:save)
      post :create, :recipe => recipe_params
    end
  end


end
