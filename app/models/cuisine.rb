class Cuisine < ApplicationRecord
  validates :name, presence: { message: 'Você deve informar o nome da cozinha' }
  validates :name, presence: { message: 'Você deve informar todos os dados do tipo da cozinha' }
  validates :name, uniqueness: { message: 'Ja existe esse nome de cozinha' }
  has_many :recipes
end
