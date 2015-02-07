class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string  :name,                 null:false
      t.integer :prep_time_in_minutes, null:false
      t.integer :servings,             null:false

      t.timestamps null: false
    end
  end
end
