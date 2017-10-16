class MessagesController < ApplicationController

	def new
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

	def creates
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
		#recieve_message
		@message = Message.where("sender_id = ?", current_account.id)
		@sum_sent_message = @message.length
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

		#recieve_message
		@conversations = Conversation.where("account1_id = ? OR account2_id = ?", current_account.id, current_account.id)
		@recieve_message ||= []
		if !@conversations.nil?
			@conversations.each do |conversation|
				@messages = Message.where(conversation_id: conversation.id).where.not("sender_id = ?", current_account.id)
				@messages.each do |mess|
					if mess.sender_id == conversation.account1_id
						@sender = Account.find_by(id: conversation.account2_id)
					else
						@sender = Account.find_by(id:conversation.account1_id)
					end
					@recieve_message.push({"message_content": mess, "sender": @sender})
				end			
			end
		end	
	end


	def show
		@message_detail = Message.find(params[:id])
		conversation = Conversation.find_by(id: @message_detail.conversation_id)
		if @message_detail.sender_id == conversation.account1_id
			@sender = Account.find_by(id: conversation.account2_id)
		else
			@sender = Account.find_by(id:conversation.account1_id)
		end
	end


end
