# == Schema Information
#
# Table name: jobs
#
#  id                      :integer          not null, primary key
#  customer                :string
#  user                    :string
#  title                   :string
#  description             :string
#  scheduled_date          :date
#  completed_date          :date
#  status                  :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  customer_id             :integer
#  user_id                 :integer
#  invoice_number          :string
#  attachment_file_name    :string
#  attachment_content_type :string
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#

class Job < ApplicationRecord
  STATUS = [
    STATUS_COMPLETED = "Completed",
    STATUS_ALLOCATED = "Allocated"
  ]
  belongs_to :customer
  belongs_to :user, optional: true
  has_many :job_reports

  validates_presence_of :scheduled_date

  has_attached_file :attachment
  validates_attachment_content_type :attachment,
    content_type: [
      'application/pdf'
    ]
  validates_attachment_size :attachment, less_than: 10.megabytes
end
