class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :type
      t.string :services
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
