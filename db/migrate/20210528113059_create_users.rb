class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.integer :age

      t.timestamps
    end
    add_index :users, :age
    add_index :users, [:last_name, :first_name, :age]
  end
end
