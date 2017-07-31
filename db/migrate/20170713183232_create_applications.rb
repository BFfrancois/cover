class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.bigint :job_id
      t.bigint :user_id
      t.string :status

      t.timestamps
    end
  end
end
