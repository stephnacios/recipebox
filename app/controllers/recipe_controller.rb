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
    form = Recipe::Form.new(recipe_params)
    use_case = Recipe::Create.new(form)
    use_case.perform

    if use_case.success?
      redirect_to view_recipe_path(use_case.recipe_id)
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
    params.slice(:name, :prep_time_in_minutes, :servings, :ingredient,
                 :ingredient_quantity, :ingredient_measurement)
  end
end
