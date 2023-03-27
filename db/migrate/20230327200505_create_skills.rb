class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.text :prior_skills
      t.integer :user_id
      t.text :current_skills
      t.string :field_of_interest
      t.string :github_link
      t.string :portfolio_link
      t.string :linkedin_link

      t.timestamps
    end
  end
end
