class AddCuisineRefToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_reference :recipes, :cuisine, foreign_key: true
  end
end
