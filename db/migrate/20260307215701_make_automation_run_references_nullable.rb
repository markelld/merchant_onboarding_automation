class MakeAutomationRunReferencesNullable < ActiveRecord::Migration[8.1]
  def change
    change_column_null :automation_runs, :advertiser_id, true
    change_column_null :automation_runs, :offer_id, true
    change_column_null :automation_runs, :integration_task_id, true
  end
end
