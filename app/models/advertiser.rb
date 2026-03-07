class Advertiser < ApplicationRecord 
    has_many :offers, dependent: :destroy
    has_many :automation_runs, dependent: :nullify
end
