class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :day
      t.string :meal
      t.string :family_id

      t.timestamps null: false
    end
  end
end
