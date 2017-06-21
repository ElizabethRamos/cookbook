class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :recipe_type
      t.string :string
      t.string :cuisine
      t.string :string
      t.string :difficulty
      t.string :string
      t.string :cook_time
      t.string :integer

      t.timestamps
    end
  end
end
