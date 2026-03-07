class CreateAutomationRuns < ActiveRecord::Migration[8.1]
  def change
    create_table :automation_runs do |t|
      t.references :merchant_intake, null: false, foreign_key: true
      t.references :advertiser, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true
      t.references :integration_task, null: false, foreign_key: true
      t.string :status
      t.datetime :started_at
      t.datetime :finished_at
      t.text :error_message

      t.timestamps
    end
  end
end
