class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.references :course, index: true, foreign_key: true
      t.string :title
      t.string :instructions
      t.string :lesson
      t.string :problem
      t.string :answer
      t.string :hints

      t.timestamps null: false
    end
  end
end
