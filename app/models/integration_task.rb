class IntegrationTask < ApplicationRecord 
    has_many :automation_runs, dependent: :nullify
end
