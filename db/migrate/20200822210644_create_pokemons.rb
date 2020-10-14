class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :pokedexNumber
      t.string :type1
      t.string :type2
      t.string :region
      t.text :description

      t.timestamps
    end
  end
end
