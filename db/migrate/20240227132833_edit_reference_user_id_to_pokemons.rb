class EditReferenceUserIdToPokemons < ActiveRecord::Migration[7.1]
  def change
    remove_reference :pokemons, :user, foreign_key: true
    add_reference :pokemons, :user, foreign_key: true, null: true
  end
end
