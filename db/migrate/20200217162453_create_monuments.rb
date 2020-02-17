class CreateMonuments < ActiveRecord::Migration[6.0]
  def change
    create_table :monuments do |t|
      t.string :address
      t.string :name
      t.string :description
      t.string :city
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
