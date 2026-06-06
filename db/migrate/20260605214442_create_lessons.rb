class CreateLessons < ActiveRecord::Migration[8.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :duration
      t.references :chapter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
