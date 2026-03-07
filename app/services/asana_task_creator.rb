class AsanaTaskCreator
  def initialize(intake, run)
    @intake = intake
    @run = run
  end

  def run!
    IntegrationTask.create!(
      asana_task_gid: "mock-task-#{SecureRandom.random_number(1000..9999)}",
      merchant_name: @intake.merchant_name,
      advertiser_external_id: @run.advertiser.advertiser_external_id,
      offer_external_id: @run.offer.offer_external_id,
      tracking_method: @intake.tracking_method,
      integration_notes: @intake.integration_notes,
      status: "created"
    )
  end
end 

