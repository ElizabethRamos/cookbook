class RemoveStringFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :string, :string
  end
end
