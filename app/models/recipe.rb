class Recipe < ApplicationRecord
  validates :title, :difficulty, :cook_time, :ingredients,
            :method, :cuisine_id,
            presence: true
  belongs_to :cuisine
  belongs_to :recipe_type
  belongs_to :user
end
