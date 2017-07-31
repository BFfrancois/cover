class AddForeignKeyToApplications < ActiveRecord::Migration[5.1]
  def change
    remove_column :applications, :job_id
    remove_column :applications, :user_id
    add_reference :applications, :job, index: true, foreign_key: true
    add_reference :applications, :user, index: true, foreign_key: true
  end
end
