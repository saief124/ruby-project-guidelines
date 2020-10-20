class CreateWorkouts < ActiveRecord::Migration[5.2]
    def change
        create_table :workouts do |t|
            t.string :name
        end
    end
end