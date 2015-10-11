require 'rails_helper'
require 'spec_helper'

RSpec.describe RecipeController, type: :controller do
  include AuthorizedUserHelper

  before do
    login_as_authorized_user
  end

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
    let(:recipe) { instance_double(Recipe, :name => 'Roast Chicken') }

    before { allow(Recipe).to receive(:find).with(id).and_return(recipe) }

    it 'retrieves the recipe with the given ID' do
      expect(Recipe).to receive(:find).with(id)
      get :show, :id => id
    end
  end

  describe '#create' do
    let(:name) { 'Roast Chicken' }
    let(:prep_time_in_minutes) { '60' }
    let(:servings) { '4' }
    let(:ingredient) { 'Banana' }
    let(:success) { true }
    let(:recipe_form) { instance_double(Recipe::Form) }
    let(:use_case) do
      instance_double(Recipe::Create,
        :success?  => success,
        :perform   => nil,
        :recipe_id => 1,
      )
    end
    let(:recipe_params) do
      {
        'name'                 => name,
        'prep_time_in_minutes' => prep_time_in_minutes,
        'servings'             => servings,
        'ingredient'           => ingredient
      }
    end

    before do
      allow(Recipe::Form).to receive(:new).and_return(recipe_form)
      allow(Recipe::Create).to receive(:new).and_return(use_case)
    end

    it 'initializes a form with the given parameters' do
      expect(Recipe::Form).to receive(:new).with(
        :name                 => name,
        :prep_time_in_minutes => prep_time_in_minutes,
        :servings             => servings,
        :ingredient           => ingredient,
      )
      post :create, recipe_params
    end

    it 'creates the recipe' do
      expect(use_case).to receive(:perform)
      post :create, recipe_params
    end

    it "redirects to the new recipe's page" do
      post :create, recipe_params
      expect(response).to redirect_to(view_recipe_path(1))
    end

    context 'when the recipe creation fails' do
      let(:success) { false }
      it 'renders the new recipe page' do
        post :create, recipe_params
        expect(response).to render_template('new')
      end
    end
  end


end
