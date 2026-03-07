class MerchantIntake < ApplicationRecord 
    has_many :automation_runs, dependent: :destroy

    validates :google_doc_url, presence: true
end
