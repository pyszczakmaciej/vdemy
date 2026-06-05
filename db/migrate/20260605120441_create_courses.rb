class CreateCourses < ActiveRecord::Migration[8.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :subtitle
      t.decimal :price
      t.boolean :free
      t.boolean :published
      t.integer :category
      t.integer :level
      t.references :instructor, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
