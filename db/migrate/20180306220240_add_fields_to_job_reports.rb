class AddFieldsToJobReports < ActiveRecord::Migration[5.1]
  def change
    add_column :job_reports, :manual_gas_two, :string
    add_column :job_reports, :manual_gas_final, :string
    add_column :job_reports, :calibration_factor, :string
    add_column :job_reports, :gas_replaced, :string
    add_column :job_reports, :consumables_invoice_number, :string
    add_column :job_reports, :calibration_successful, :string
  end
end
