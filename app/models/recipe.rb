class Recipe < ActiveRecord::Base
  has_many :ingredients, through: :recipe_ingredients

  validates :name, :servings, :prep_time_in_minutes, :presence => true
end
