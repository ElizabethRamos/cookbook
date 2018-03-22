class RecipeType < ApplicationRecord
  validates :name, presence: true
  has_many :recipes, dependent: :destroy
end
