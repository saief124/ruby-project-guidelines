class RemoveTraineeAndAddUserId < ActiveRecord::Migration[5.2]
  def change
    remove_column :workouts, :trainee, :string
    add_column :workouts, :user_id, :integer
  end
end
