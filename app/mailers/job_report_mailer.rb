class JobReportMailer < ApplicationMailer
  def send_certificate(job_report)
    @job_report = job_report

    attachments["Certificate.pdf"] =
      WickedPdf.new.pdf_from_string(
        render_to_string(
          pdf: "Certificate",
          file: 'pdfs/certificate',
          locals: {
            job_report: job_report
          }
        )
      )
    return false if job_report.job.customer&.email.blank?
    
    mail(
      to: job_report.job.customer&.email,
      subject: "Certificate"
    )
  end
end