class CreateCategoriesRecipes < ActiveRecord::Migration
  def change
    create_table :categories_recipes, :id => false do |t|
        t.integer :category_id
        t.integer :recipe_id

    end
  end
end
