class Job < ApplicationRecord
  belongs_to :customer
  belongs_to :user, optional: true
end
