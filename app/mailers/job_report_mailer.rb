class JobReportMailer < ApplicationMailer
  def send_certificate(job_report)
    @job_report = job_report


    return false if job_report.job.customer&.email.blank?
    
    mail(
      to: job_report.job.customer&.email,
      subject: "Certificate"
    )
  end
end