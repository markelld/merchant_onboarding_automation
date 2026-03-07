class MerchantIntakeValidator
  REQUIRED_FIELDS = %i[
    merchant_name
    website
    contact_name
    contact_email
    offer_name
    payout_type
    payout_amount
    tracking_method
  ].freeze

  def self.call(attrs)
    errors = []

    REQUIRED_FIELDS.each do |field|
      errors << "#{field} is missing" if attrs[field].blank?
    end

    unless attrs[:contact_email].to_s.match?(/\A[^@\s]+@[^@\s]+\z/)
      errors << "contact_email is invalid"
    end

    unless attrs[:website].to_s.start_with?("http://", "https://")
      errors << "website is invalid"
    end

    unless attrs[:payout_amount].to_s.match?(/\A\d+(\.\d+)?\z/)
      errors << "payout_amount must be numeric"
    end

    errors
  end
end