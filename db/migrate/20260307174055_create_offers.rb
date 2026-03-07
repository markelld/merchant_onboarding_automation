class CreateOffers < ActiveRecord::Migration[8.1]
  def change
    create_table :offers do |t|
      t.string :offer_external_id
      t.references :advertiser, null: false, foreign_key: true
      t.string :offer_name
      t.string :payout_type
      t.string :payout_amount
      t.string :tracking_method

      t.timestamps
    end
  end
end
