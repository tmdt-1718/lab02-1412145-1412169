class FriendsController < ApplicationController
    before_action :logged_in_account, only: [:index]

    def index
        friendships = Conversation.find_by(sender_id: current_account.id)
        if !friendships.nil?
            friendships.each do |friendship|
                @friendlist += Account.find_by(id: friendship.recipient_id)
            end
        else
            @friendlist = nil
        end
    end

    def new
        @account = Account.all
    end

    def create
        if !Conversation.find_by(sender_id: current_account.id, recipient_id: params[:requestedid]).nil?
            # friendship existed
        else
            @friendship = Conversation.new(sender_id: current_account.id, recipient_id: params[:requestedid])
            @friendship.save
            redirect_to friends_path
        end
    end

    private
        # Confirms a logged-in account.
        def logged_in_account
            unless logged_in?
            redirect_to login_path
            end
        end   
end
