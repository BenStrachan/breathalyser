class ChangeColumnToDate < ActiveRecord::Migration[5.1]
  def change
    change_column :jobs, :scheduled_date, "date USING CAST(case when scheduled_date = '' then null else scheduled_date end AS date)"
    change_column :jobs, :completed_date, "date USING CAST(case when completed_date = '' then null else completed_date end AS date)"
  end
end
