class CreateExperiences < ActiveRecord::Migration[5.1]

  def change
    create_table :experiences do |t|
      t.bigint :user_id, index: true, foreign_key: true
      t.bigint :jobtype_id, index: true, foreign_key: true
      t.string :employer_name
      t.integer :months
      t.text :description
    end

  end

end
