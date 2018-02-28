class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :business_name
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :phone
      t.string :email
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
