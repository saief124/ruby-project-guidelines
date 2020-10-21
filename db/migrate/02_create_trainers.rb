class CreateTrainers < ActiveRecord::Migration[5.2]
    def change
        create_table :trainers do |t|
            t.string :name
            t.integer :zipcode
            t.integer :yrs_experience
            t.integer :cost
            t.string  :about_me
        end
    end