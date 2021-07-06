class AddLocaleToSeminar < ActiveRecord::Migration[6.1]
  def up
    add_column :seminars, :locale, :text
  end

  def down
    remove_column :seminars, :locale, :text
  end
end
