class AddRegionToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :region, :string
    add_column :jobs, :invoice_number, :string
  end
end
