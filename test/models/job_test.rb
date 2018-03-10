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

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
