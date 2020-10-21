class CreateWorkouts < ActiveRecord::Migration[5.2]
    def change
        create_table :workouts do |t|
            t.string :trainer_name
            t.string :trainee
            #t.time :time_started
            #t.time :time_end
            #t.datetime :workout_date
            t.string :exercises_done
        end
    end
end