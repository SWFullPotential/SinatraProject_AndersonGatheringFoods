class User < ActiveRecord::Base
    has_many :meals
    
    validates :username, presence: true, uniqueness: true 
    validates :password, presence: true
    
    has_secure_password

    def owns_meal?(meal)
        self.meals.include?(meal)
    end

end
