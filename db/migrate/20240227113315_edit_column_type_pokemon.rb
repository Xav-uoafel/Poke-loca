class EditColumnTypePokemon < ActiveRecord::Migration[7.1]
  def change
    rename_column :pokemons, :type, :type_pokemon
  end
end
