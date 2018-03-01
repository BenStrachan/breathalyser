# == Schema Information
#
# Table name: customers
#
#  id                 :integer          not null, primary key
#  business_name      :string
#  contact_first_name :string
#  contact_last_name  :string
#  phone              :string
#  email              :string
#  address1           :string
#  address2           :string
#  city               :string
#  state              :string
#  country            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
