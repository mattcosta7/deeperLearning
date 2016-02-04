class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.datetime :birthday
      t.string :location
      t.text :hobbies
      t.boolean :admin, default: false
      t.timestamps null: false
    end
  end
end
