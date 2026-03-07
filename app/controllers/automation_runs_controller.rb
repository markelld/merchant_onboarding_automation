class AutomationRunsController < ApplicationController 
    def show
        @run = AutomationRun.find(params[:id])
    end
end
