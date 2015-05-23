class RecipeController < ApplicationController

  def index
    @heading = "Recipes List"
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

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
    params.require(:recipe).permit(:name, :prep_time_in_minutes, :servings)
  end
end
