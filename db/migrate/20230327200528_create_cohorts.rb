class CreateCohorts < ActiveRecord::Migration[6.0]
  def change
    create_table :cohorts do |t|
      t.date :cohort_start
      t.string :name
      t.date :cohort_end

      t.timestamps
    end
  end
end
