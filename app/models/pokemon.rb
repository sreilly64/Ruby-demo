class Pokemon < ApplicationRecord
    validates :name, presence: true, length: {minimum: 3}, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters." }
    validates :pokedexNumber, presence: true, uniqueness: true, numericality: { only_integer: true }
    validates :type1, presence: true, inclusion: { in: %w(Normal Fire Water Electric Grass Ice Fighting Poison Ground Flying Psychic Bug Rock Ghost Dragon Dark Steel Fairy),
        message: "%{value} is not a valid type." }
    validates :type2, inclusion: { in: %w(Normal Fire Water Electric Grass Ice Fighting Poison Ground Flying Psychic Bug Rock Ghost Dragon Dark Steel Fairy),
        message: "%{value} is not a valid type." }, allow_blank: true
    validates :region, inclusion: { in: %w(Kanto Johto Hoenn Sinnoh Unova Kalos Alola Galar), message: "%{value} is not a valid region."}
end
