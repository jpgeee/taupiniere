class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name
      t.string :firstname
      t.date :birthday
      t.boolean :admin, default: false
      t.boolean :teacher, default: false
      t.boolean :questioner, default: false
      t.string :password_digest, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
