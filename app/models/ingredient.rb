class Ingredient < ActiveRecord::Base
  validates_uniqueness_of :name

  def self.find_or_create(name:)
    Ingredient.where(:name => name).first || Ingredient.create!(:name => name)
  end
end
