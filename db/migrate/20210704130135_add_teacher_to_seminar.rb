class AddTeacherToSeminar < ActiveRecord::Migration[6.1]
  def up
    add_reference :seminars, :teacher, null: false, foreign_key: { to_table: :users }
  end

  def down
    remove_reference :seminars, :teacher, null: false, foreign_key: { to_table: :users }
  end
end
