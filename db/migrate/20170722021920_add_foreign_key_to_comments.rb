class AddForeignKeyToComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :job_id
    remove_column :comments, :user_id
    add_reference :comments, :job, index: true, foreign_key: true
    add_reference :comments, :user, index: true, foreign_key: true
  end
end
