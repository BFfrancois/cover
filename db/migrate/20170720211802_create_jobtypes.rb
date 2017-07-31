class CreateJobtypes < ActiveRecord::Migration[5.1]

  def change

    create_table :jobtypes do |t|
      t.string :name
    end

  end

end
