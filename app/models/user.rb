class User < ActiveRecord::Base
    has_many :workouts
    has_many :trainers, through: :workouts

    def add_user_info
        #prompt user for name, location, goals, gender, weight, height and add them to the table
    end

    def match_trainers
    #match users with trainers based on zipcode
    end

    def create_workouts
    
    end
    
    def update_workouts

    end

    def delete_workouts

    end

    def see_my_workouts

    end
end
