class OffersController < ApplicationController
  def new
    @advertiser = Advertiser.find(params[:advertiser_id])
  end

  def create
    advertiser = Advertiser.find(params[:offer][:advertiser_id])

    @offer = Offer.create!(
      advertiser: advertiser,
      offer_external_id: "OFF-#{SecureRandom.random_number(10000..99999)}",
      offer_name: params[:offer][:offer_name],
      payout_type: params[:offer][:payout_type],
      payout_amount: params[:offer][:payout_amount],
      tracking_method: params[:offer][:tracking_method]
    )

    redirect_to portal_offer_path(@offer)
  end

  def show
    @offer = Offer.find(params[:id])
  end
end