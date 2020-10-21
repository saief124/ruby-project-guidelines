class AddYrsExperienceAndCostAndAboutMe < ActiveRecord::Migration[5.2]
  def change
    add_column :trainers, :yrs_exp, :integer
    add_column :trainers, :cost, :float
    add_column :trainers, :about_me, :string 
  end
end
