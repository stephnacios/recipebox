class Recipe::Create
  include ActiveModel::Validations
  # include Virtus.model

  attr_reader :recipe
  delegate :id, :to => :recipe, :prefix => true

  def initialize(form)
    @form = form
  end

  def perform
    form_valid? && create_recipe
  end

  def success?
    errors.none?
  end

private

  attr_reader :form

  def create_recipe
    @recipe = Recipe.new(
      :name                 => form.name,
      :prep_time_in_minutes => form.prep_time_in_minutes,
      :servings             => form.servings
    )
    @recipe.ingredients = [ create_ingredient ]
    @recipe.save!
  end

  def create_ingredient
    Ingredient.find_or_create(:name => form.ingredient)
  end

  def form_valid?
    if form.valid?
      return true
    else
      errors.add(:base, form.errors.full_messages)
      return false
    end
  end
end
