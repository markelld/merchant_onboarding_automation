class Offer < ApplicationRecord
  belongs_to :advertiser 
  has_many :automation_runs, dependent: :nullify
end
