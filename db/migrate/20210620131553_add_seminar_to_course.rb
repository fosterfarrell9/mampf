class AddSeminarToCourse < ActiveRecord::Migration[6.1]
  def up
    add_column :courses, :seminar, :boolean, default: false
  end

  def down
    remove_column :courses, :seminar, :boolean
  end
end
