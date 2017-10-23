class FriendsController < ApplicationController
    before_action :logged_in_account, only: [:index, :new, :create, :acceptrequest, :deleterequest, :blockfriend, :unblockfriend]

    def index
        @friendlist ||= []
        @request_list ||= []
        @wait_for_accept_list ||= []
        @blocked_list ||= []

        # get friend list
        friendships = Friend.where("account_id = ? OR friend_id = ?", current_account.id, current_account.id)
        if !friendships.nil?
            friendships.each do |friendship|
                # get friend list
                if friendship.state_friendship == "accepted"
                    if friendship.account_id == current_account.id
                        @friendlist.push(Account.find_by(id: friendship.friend_id))
                    else
                        @friendlist.push(Account.find_by(id: friendship.account_id))
                    end
                else
                    if friendship.state_friendship == "request"
                        # get wait_for_accept list
                        if friendship.account_id == current_account.id
                            @wait_for_accept_list.push(Account.find_by(id: friendship.friend_id))
                        else
                            @request_list.push(Account.find_by(id: friendship.account_id))
                        end
                    else
                        #blocked list
                        if friendship.state_friendship == "blocked"
                            if friendship.account_id == current_account.id
                                block_friendship = BlockFriend.find_by(account_id: current_account.id, blocked_id: friendship.friend_id)
                            else
                                block_friendship = BlockFriend.find_by(account_id: current_account.id, blocked_id: friendship.account_id)
                            end
                            if !block_friendship.nil?
                                @blocked_list.push(Account.find_by(id: block_friendship.blocked_id))
                            end
                        end
                    end
                end
                
            end
        end
    end

    def new
        @account = Account.all

        friendships = Friend.where("account_id = ? OR friend_id = ?", current_account.id, current_account.id)
        if !friendships.nil?
            friendships.each do |friendship|
                if friendship.account_id == current_account.id
                    @account -= [Account.find_by(id: friendship.friend_id)]
                else
                    @account -= [Account.find_by(id: friendship.account_id)]
                end
            end
        end

        @account -= [Account.find_by(id: current_account.id)]
    end

    def create
        if !Friend.find_by(account_id: current_account.id, friend_id: params[:requestedid]).nil? || !Friend.find_by(account_id: params[:requestedid], friend_id: current_account.id).nil?
            # friendship existed
        else
            @friendship = Friend.new(account_id: current_account.id, friend_id: params[:requestedid], state_friendship: "request")
            @friendship.save
            redirect_to friends_path
        end
    end

    def acceptrequest
        @friendship = Friend.find_by(account_id: params[:id], friend_id: current_account.id)
        @friendship.update(state_friendship: "accepted")
        redirect_to friends_path
    end

    def deleterequest
        @friendship = Friend.find_by(account_id: params[:id], friend_id: current_account.id)
        if !@friendship.nil?
            @friendship.destroy
        else
            @friendship = Friend.find_by(account_id: current_account.id, friend_id: params[:id])
            @friendship.destroy
        end
        redirect_to friends_path
    end

    def blockfriend
        @friendship = Friend.find_by(account_id: current_account.id, friend_id: params[:id])
        if !@friendship.nil?
        else
            @friendship = Friend.find_by(account_id: params[:id], friend_id: current_account.id)
        end

        if !@friendship.nil?
            # have friendship before
            old_state = @friendship.state_friendship

            @block_friend = BlockFriend.new(account_id: current_account.id, blocked_id: params[:id], state_before: old_state)
            @block_friend.save

            @friendship.update(state_friendship: "blocked")
        else
            @block_friend = BlockFriend.new(account_id: current_account.id, blocked_id: params[:id], state_before: "none")
            @block_friend.save
            
            @friendship = Friend.new(account_id: current_account.id, friend_id: params[:id], state_friendship: "blocked")
            @friendship.save
        end

        redirect_to friends_path
    end

    def unblockfriend
        block_friend = BlockFriend.find_by(account_id: current_account.id, blocked_id: params[:id])
        state_before = block_friend.state_before
        if state_before != "none"
            friendship = Friend.find_by(account_id: current_account.id, friend_id: params[:id])
            if !friendship.nil?
            else
                friendship = Friend.find_by(account_id: params[:id], friend_id: current_account.id)
            end
            friendship.update(state_friendship: state_before)
        end
        block_friend.destroy

        redirect_to friends_path
    end

    private
        # Confirms a logged-in account.
        def logged_in_account
            unless logged_in?
                redirect_to login_path
            end
        end   
end
