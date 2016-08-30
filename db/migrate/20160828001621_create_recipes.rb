class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|

      t.text:name
      t.text:instructions
      t.text:image
      t.text:category
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
