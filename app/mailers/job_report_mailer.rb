class JobReportMailer < ApplicationMailer
  def send_certificate
    attachments["Certificate.pdf"] =
      WickedPdf.new.pdf_from_string(
        render_to_string(
          pdf: "Certificate",
          file: 'pdfs/certificate',
        )
      )

    mail(
      to: "chutuan@gmail.com",
      subject: "Certificate"
    )
  end
end