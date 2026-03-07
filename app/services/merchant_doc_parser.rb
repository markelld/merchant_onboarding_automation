class MerchantDocParser
  FIELD_MAP = {
    "Merchant Name" => :merchant_name,
    "Website" => :website,
    "Contact Name" => :contact_name,
    "Contact Email" => :contact_email,
    "Vertical" => :vertical,
    "Country" => :country,
    "Currency" => :currency,
    "Offer Name" => :offer_name,
    "Payout Type" => :payout_type,
    "Payout Amount" => :payout_amount,
    "Tracking Method" => :tracking_method,
    "Integration Notes" => :integration_notes
  }.freeze

  def self.call(text)
    result = {}

    text.each_line do |line|
      key, value = line.split(":", 2).map { |part| part&.strip }
      next unless key && value
      next unless FIELD_MAP[key]

      result[FIELD_MAP[key]] = value
    end

    result
  end
end