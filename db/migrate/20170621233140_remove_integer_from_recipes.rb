class RemoveIntegerFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :integer, :string
  end
end
