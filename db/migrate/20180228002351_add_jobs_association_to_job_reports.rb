class AddJobsAssociationToJobReports < ActiveRecord::Migration[5.1]
  def change
    add_reference :job_reports, :job, index: true
  end
end
