class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :paragraph1
      t.string :image
      t.text :paragraph2
      t.string :video
      t.text :paragraph3
      t.string :badge

      t.timestamps
    end
  end
end
