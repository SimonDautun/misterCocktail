class Cocktail < ApplicationRecord
  # You can t delete an ingredient if it is used by at least one cocktail.
  # When you delete a cocktail, you should delete associated doses (but not the ingredients as they can be linked to other cocktails).
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, uniqueness: true, presence: true, allow_blank: false
end
