class ChangeItemsGenreIdNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :genre_id, :integer, null: false
  end
end
