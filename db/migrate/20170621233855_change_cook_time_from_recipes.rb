class ChangeCookTimeFromRecipes < ActiveRecord::Migration[5.1]
  def change
    change_column(:recipes, :cook_time, 'integer USING CAST(cook_time AS integer)')
  end
end
