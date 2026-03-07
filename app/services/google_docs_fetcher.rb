class GoogleDocsFetcher
  def initialize(document_id)
    @document_id = document_id
  end

  def call
    <<~TEXT
      Merchant Name: Acme Supplements
      Website: https://acmesupplements.com
      Contact Name: Jordan Lee
      Contact Email: jordan@acmesupplements.com
      Vertical: Health
      Country: US
      Currency: USD
      Offer Name: Spring CPA Offer
      Payout Type: CPA
      Payout Amount: 45
      Tracking Method: Postback
      Integration Notes: Need pixel and postback support
    TEXT
  end
end