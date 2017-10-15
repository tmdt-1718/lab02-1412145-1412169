class MessagesController < ApplicationController
	def new
		# @message = Message.new

		@friendlist ||= []
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
                end
            end
        end


	end

	def create
		# render plain: params[:message][:friend_id]
		content_message = params[:message][:content]
		friend_id = params[:message][:friend_id]
		@conversation = Conversation.find_by(account1_id: current_account.id, account2_id: friend_id)
		if !@conversation.nil?
		else
			@conversation = Conversation.find_by(account1_id: friend_id, account2_id: current_account.id)
		end

		if !@conversation.nil?
			#conversation exists before
		else
			@conversation = Conversation.new(account1_id: current_account.id, account2_id: friend_id)
			@conversation.save
		end

		@message = Message.new(body: content_message, sender_id: current_account.id, conversation_id: @conversation.id, unread: true)
		@message.save

		@conversation.update(last_message_id: @message.id)

		redirect_to messages_path
	end

	def index
		@message = Message.where("sender_id = ?", current_account.id)
		@sent_message ||= []
		if !@message.nil?
			@message.each do |message|
				conversation = Conversation.find_by(id: message.conversation_id)
				if conversation.account1_id == current_account.id
					@recipient = Account.find_by(id: conversation.account2_id)
				else
					@recipient = Account.find_by(id: conversation.account1_id)
				end
				@sent_message.push({"message_content": message, "recipient": @recipient})
			end
		end
	end
>>>>>>> f81ae201fbc35177fe4e4ea69dd84356107522a4
end
