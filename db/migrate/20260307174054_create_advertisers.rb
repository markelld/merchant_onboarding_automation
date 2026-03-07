class CreateAdvertisers < ActiveRecord::Migration[8.1]
  def change
    create_table :advertisers do |t|
      t.string :advertiser_external_id
      t.string :merchant_name
      t.string :website
      t.string :contact_name
      t.string :contact_email
      t.string :vertical

      t.timestamps
    end
  end
end
