class AddCohortIdToCohorts < ActiveRecord::Migration[6.0]
  def change
    add_column :cohorts, :cohort_id, :integer
  end
end
