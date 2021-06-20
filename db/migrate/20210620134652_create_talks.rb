class CreateTalks < ActiveRecord::Migration[6.1]
  def change
    create_table :talks do |t|
      t.references :seminar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
