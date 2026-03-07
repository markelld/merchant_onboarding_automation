require "json"

class PortalAutomationRunner
  def initialize(intake, run)
    @intake = intake
    @run = run
  end

  def run!
    File.write(
      Rails.root.join("tmp", "intake.json"),
      {
        merchant_name: @intake.merchant_name,
        website: @intake.website,
        contact_name: @intake.contact_name,
        contact_email: @intake.contact_email,
        vertical: @intake.vertical,
        offer_name: @intake.offer_name,
        payout_type: @intake.payout_type,
        payout_amount: @intake.payout_amount,
        tracking_method: @intake.tracking_method
      }.to_json
    )

    success = system("npx playwright test playwright/portal_pipeline.spec.ts")
    raise "Portal automation failed" unless success

    result = JSON.parse(File.read(Rails.root.join("tmp", "portal_result.json")))

    advertiser = Advertiser.find_by!(
      advertiser_external_id: result["advertiser_external_id"]
    )

    offer = Offer.find_by!(
      offer_external_id: result["offer_external_id"]
    )

    @run.update!(
      advertiser: advertiser,
      offer: offer
    )
  end
end