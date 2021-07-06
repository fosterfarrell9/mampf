class AddTitleToSeminar < ActiveRecord::Migration[6.1]
  def up
    add_column :seminars, :title, :text
  end

  def down
    remove_column :seminars, :title, :text
  end
end
