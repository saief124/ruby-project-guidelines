class CreateUsers < ActiveRecord::Migration[5.2]
    def change
    create_table :users do |t|
        t.string :name
        t.string :gender
        t.float :weight
        t.float :height
        #t.timestamp :start_time


        end
    end
end