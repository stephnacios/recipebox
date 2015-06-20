class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  has_many :ingredients
  has_many :measurements
end
