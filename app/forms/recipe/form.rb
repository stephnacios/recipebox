class Recipe::Form
  include ActiveModel::Validations
  include Virtus.model

  attribute :name,                   String
  attribute :prep_time_in_minutes,   Fixnum
  attribute :servings,               Fixnum
  attribute :ingredient,             String
  attribute :ingredient_quantity,    Fixnum
  attribute :ingredient_measurement, String

  validates :name, :prep_time_in_minutes, :servings, :ingredient, presence: true

  def initialize(attributes = {})
    super(attributes)
  end
end
