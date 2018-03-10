class AddColumnSentCertificateToJobReports < ActiveRecord::Migration[5.1]
  def change
    add_column :job_reports, :sent_certificate_at, :datetime
  end
end
