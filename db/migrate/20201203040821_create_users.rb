class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t| 
      t.string :name
      t.string :email
      t.string :payment_method
      #t.string :address
    end
  end
end
