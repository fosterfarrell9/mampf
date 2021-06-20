class AddSortToSeminar < ActiveRecord::Migration[6.1]
  def up
    add_column :seminars, :sort, :integer
    add_index :seminars, :sort
  end

  def down
    remove_index :seminars, :sort
    remove_column :seminars, :sort, :integer
  end
end
