class AddCustomerAndUserAssociationOnJobReport < ActiveRecord::Migration[5.1]
  def change
    add_reference :job_reports, :user, index: true
    add_reference :job_reports, :customer, index: true
  end
end
