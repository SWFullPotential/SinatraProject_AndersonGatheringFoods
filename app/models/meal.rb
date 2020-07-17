class Meal < ActiveRecord::Base
    belongs_to :user

    validates :day_meal, presence: true, uniqueness: true
    
    
end
