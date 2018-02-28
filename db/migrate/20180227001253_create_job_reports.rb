class CreateJobReports < ActiveRecord::Migration[5.1]
  def change
    create_table :job_reports do |t|
      t.string :job
      t.string :customer
      t.string :user
      t.string :serial_number
      t.string :service_date
      t.string :previous_date
      t.string :clean_air
      t.string :manual_gas
      t.string :gas_level
      t.string :total_count
      t.string :download
      t.string :raw_reading
      t.string :comment

      t.timestamps
    end
  end
end
