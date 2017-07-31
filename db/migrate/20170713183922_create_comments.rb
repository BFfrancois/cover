class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.bigint :job_id
      t.bigint :user_id
      t.text    :comment

      t.timestamps
    end
  end
end
