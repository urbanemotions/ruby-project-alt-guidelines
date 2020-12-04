class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t| 
      t.string :name
      t.float :price
      t.boolean :status 
    end
  end
end
