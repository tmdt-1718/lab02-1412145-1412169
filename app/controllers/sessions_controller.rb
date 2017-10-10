class SessionsController < ApplicationController
    def new
    end

    def create
      account = Account.find_by(username: params[:session][:username])
      if account && account.authenticate(params[:session][:password])
        log_in account
        redirect_to root_path
      else
        # Create an error message.
        render 'new'
      end
    end
    
    def destroy
      log_out
      redirect_to root_path
    end
end
