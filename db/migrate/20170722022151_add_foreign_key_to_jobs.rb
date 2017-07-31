class AddForeignKeyToJobs < ActiveRecord::Migration[5.1]
  def change
    remove_column :jobs, :jobtype_id
    remove_column :jobs, :user_id
    add_reference :jobs, :jobtype, index: true, foreign_key: true
    add_reference :jobs, :user, index: true, foreign_key: true
  end
end
