class MerchantIntakesController < ApplicationController 
    def new 
        @merchant_intake = MerchantIntake.new
    end 

    def create 
        @merchant_intake = MerchantIntake.create!(
            google_doc_url: params[:merchant_intake][:google_doc_url],
            status: "submitted"
        ) 

        redirect_to merchant_intake_path(@merchant_intake)
    end  

    def show 
        @merchant_intake = MerchantIntake.find(params[:id])
    end

    def run_pipeline 
        intake = MerchantIntake.find(params[:id]) 

        run = AutomationRun.create!(
            merchant_intake: intake,
            status: "running",
            started_at: Time.current
        ) 

        begin
            GoogleDocsIngestionService.new(intake).run!
            PortalAutomationRunner.new(intake, run).run! 
            task = AsanaTaskCreator.new(intake, run).run!

            run.update!(
                integration_task: task,
                status: "completed",
                finished_at: Time.current
            ) 
        rescue => e
            run.update!(status: "failed", finished_at: Time.current)
            raise e
        end

        redirect_to automation_run_path(run)
    end
end
