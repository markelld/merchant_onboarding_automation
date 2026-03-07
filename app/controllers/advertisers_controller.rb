class AdvertisersController < ApplicationController
  def new
    @advertiser = Advertiser.new
  end

  def create
    external_id = "ADV-#{SecureRandom.random_number(10000..99999)}"

    @advertiser = Advertiser.create!(
      advertiser_external_id: external_id,
      merchant_name: params[:advertiser][:merchant_name],
      website: params[:advertiser][:website],
      contact_name: params[:advertiser][:contact_name],
      contact_email: params[:advertiser][:contact_email],
      vertical: params[:advertiser][:vertical]
    )

    redirect_to portal_advertiser_path(@advertiser)
  end

  def show
    @advertiser = Advertiser.find(params[:id])
  end
end
