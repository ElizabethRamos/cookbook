class Recipe < ApplicationRecord
  validates :title, :difficulty, :cook_time, :ingredients,
            :method, :cuisine_id,
            presence: { message: 'Você deve informar todos os dados da
receita' }
  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :photo, content_type: %r{\Aimage/.*\z}

  belongs_to :cuisine
  belongs_to :recipe_type
  belongs_to :user
end
