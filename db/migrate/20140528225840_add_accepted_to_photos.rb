class AddAcceptedToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :accepted, :boolean, default: false, null: false
  end
end
