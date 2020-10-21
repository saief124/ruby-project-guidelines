class RemoveTrainerNameAndAddTrainerId < ActiveRecord::Migration[5.2]
  def change
    remove_column :workouts, :trainer_name, :string
    add_column :workouts, :trainer_id, :integer
  end
end
