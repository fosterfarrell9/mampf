class AddHiddenToChapter < ActiveRecord::Migration[5.2]
  def change
    add_column :chapters, :hidden, :boolean
  end
end
