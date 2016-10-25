class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email_id
      t.string :name
      t.boolean :admin, :default => false
      t.text :password_digest
      t.timestamps null: false
    end
  end
end
