class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :names

      t.timestamps null: false
    end
  end
end
