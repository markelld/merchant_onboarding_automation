class CreateMerchantIntakes < ActiveRecord::Migration[8.1]
  def change
    create_table :merchant_intakes do |t|
      t.string :google_doc_url
      t.string :google_doc_id
      t.text :raw_text
      t.string :merchant_name
      t.string :website
      t.string :contact_name
      t.string :contact_email
      t.string :vertical
      t.string :country
      t.string :currency
      t.string :offer_name
      t.string :payout_type
      t.string :payout_amount
      t.string :tracking_method
      t.text :integration_notes
      t.string :status
      t.text :validation_errors

      t.timestamps
    end
  end
end
