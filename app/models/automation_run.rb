class AutomationRun < ApplicationRecord
  belongs_to :merchant_intake
  belongs_to :advertiser, optional: true
  belongs_to :offer, optional: true
  belongs_to :integration_task, optional: true
end
