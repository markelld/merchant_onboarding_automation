class GoogleDocsIngestionService
  def initialize(intake)
    @intake = intake
  end

  def run!
    doc_id = GoogleDocIdExtractor.call(@intake.google_doc_url)
    raw_text = GoogleDocsFetcher.new(doc_id).call
    parsed = MerchantDocParser.call(raw_text)
    errors = MerchantIntakeValidator.call(parsed)

    @intake.update!(
      google_doc_id: doc_id,
      raw_text: raw_text,
      merchant_name: parsed[:merchant_name],
      website: parsed[:website],
      contact_name: parsed[:contact_name],
      contact_email: parsed[:contact_email],
      vertical: parsed[:vertical],
      country: parsed[:country],
      currency: parsed[:currency],
      offer_name: parsed[:offer_name],
      payout_type: parsed[:payout_type],
      payout_amount: parsed[:payout_amount],
      tracking_method: parsed[:tracking_method],
      integration_notes: parsed[:integration_notes],
      status: errors.empty? ? "validated" : "invalid",
      validation_errors: errors.join(", ")
    )

    raise "Validation failed: #{errors.join(', ')}" if errors.any?
  end
end