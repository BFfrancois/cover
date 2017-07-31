class CreateReviews < ActiveRecord::Migration[5.1]

  def change

    create_table :reviews do |t|
      t.bigint :user_by, index: true, foreign_key: true
      t.bigint :user_about, index: true, foreign_key: true
      t.bigint :rating
      t.text :comment
    end

  end

end
