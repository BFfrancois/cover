class FixForeignKeys < ActiveRecord::Migration[5.1]
  def change
    remove_column :usertypes, :user_type, :string
    add_column :usertypes, :name, :string

    remove_column :users, :usertype_id, :string
    add_reference :users, :usertype, index:true, foreign_key: true
  end
end



#     add_reference :products, :category, index: true, foreign_key: true

