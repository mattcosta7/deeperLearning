class AddIconToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :icon, :string
  end
end
