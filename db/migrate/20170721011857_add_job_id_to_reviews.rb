class AddJobIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :job, index: true

  end
end
