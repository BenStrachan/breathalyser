class AddCustomerAssociationToJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :customer, index: true
  end
end
