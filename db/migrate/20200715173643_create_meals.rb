class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :day_meal
      t.string :food
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
