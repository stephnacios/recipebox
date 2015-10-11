class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients

  validates :name, :servings, :prep_time_in_minutes, :presence => true

  def add_ingredient(ingredient)
    self.recipe_ingredients << RecipeIngredient.new(:ingredient => ingredient)
  end

end
