class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t| 
      t.integer :user_id #foreign key
      t.integer :subscription_id #foreign key
      t.integer :rating 
      t.string :description 
    end
  end
end