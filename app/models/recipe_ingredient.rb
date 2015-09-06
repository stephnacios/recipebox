class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  # has_many :ingredients
  has_many :measurements
end
