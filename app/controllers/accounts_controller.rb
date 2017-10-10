class AccountsController < ApplicationController
    before_action :logged_in_account, only: [:show]
    before_action :correct_account, only: [:show]

    def show
        @account = Account.find(params[:id])
        if @account.avatar
        else
            @account.update(avatar: "https://openclipart.org/image/2400px/svg_to_png/247319/abstract-user-flat-3.png")
        end
    end

    def new
        @account = Account.new
    end        

    def create
        @account = Account.new(account_params)
        if @account.save
            @account.update(avatar: "https://openclipart.org/image/2400px/svg_to_png/247319/abstract-user-flat-3.png")
            log_in @account
            redirect_to @account
        else
            render 'new'
        end
    end

    private
        def account_params
            params.require(:account).permit(:fullname, :username, :password, :password_confirmation)
        end

        # Confirms a logged-in account.
        def logged_in_account
            unless logged_in?
            redirect_to login_path
            end
        end

        # Confirms the correct user.
        def correct_account
            @account = Account.find(params[:id])
            redirect_to(root_path) unless current_account == @account
        end
end
