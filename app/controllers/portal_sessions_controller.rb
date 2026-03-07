class PortalSessionsController < ApplicationController 
    def new; end

    def create  
        if params[:email] == "admin@test.com" && params[:password] == "password"
            session[:user_id] = 1 
            redirect_to "/portal/advertisers/new"
        else
            render :new, status: :unprocessable_entity
        end
    end
end 
