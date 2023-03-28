class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :quote, :string
    add_column :users, :fun_fact, :string
    add_column :users, :resume_link, :string
  end
end
