class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true, allow_blank: false

  # tables cocktail & ingredient --> liees par la table doses
  validates :cocktail, uniqueness: { scope: :ingredient }
end
