class RemoveJobId < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :job_id
    add_reference :reviews, :user, index: true, foreign_key: true
  end
end
