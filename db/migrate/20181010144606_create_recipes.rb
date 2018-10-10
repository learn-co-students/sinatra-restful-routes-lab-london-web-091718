class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :ingredients
      t.string :name
      t.string :cook_time
    end
  end
end
