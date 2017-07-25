class AddAttachmentPhotoToRecipes < ActiveRecord::Migration[5.1]

  def self.up
    change_table :recipes do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :recipes, :photo
  end
end
