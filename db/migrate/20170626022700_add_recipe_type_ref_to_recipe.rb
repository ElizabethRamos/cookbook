class AddRecipeTypeRefToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_reference :recipes, :recipe_type, foreign_key: true
  end
end
