class AddTermToSeminar < ActiveRecord::Migration[6.1]
  def up
    add_reference :seminars, :term, null: true, foreign_key: true
  end

  def down
    remove_reference :seminars, :term, null: true, foreign_key: true
  end
end
