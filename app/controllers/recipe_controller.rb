class RecipeController < ApplicationController
  before_filter :require_user

  def index
    @heading = "Recipes List"
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.ingredients = ingredient

    if @recipe.save
      redirect_to view_recipe_path(@recipe.id)
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(recipe_id)
    @heading = @recipe.name
  end

private

  def recipe_id
    @recipe_id ||= params[:id].to_i
  end

  def recipe_params
    params.require(:recipe).permit(:name, :prep_time_in_minutes, :servings, :ingredient)
  end

  def ingredient
    [ Ingredient.find_or_create(:name => params["ingredient"]) ]
  end
end
