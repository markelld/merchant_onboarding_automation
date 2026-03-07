class CreateIntegrationTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :integration_tasks do |t|
      t.string :asana_task_gid
      t.string :merchant_name
      t.string :advertiser_external_id
      t.string :offer_external_id
      t.string :tracking_method
      t.text :integration_notes
      t.string :status

      t.timestamps
    end
  end
end
