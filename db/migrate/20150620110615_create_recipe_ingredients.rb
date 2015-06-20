class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :quantity
      t.integer :measurement_id
    end

    add_index :recipe_ingredients, :recipe_id
  end
end
