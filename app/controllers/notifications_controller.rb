class NotificationsController < ApplicationController
	before_action :find_item
	

	def create
		
		params = formated_notification_params(notification_params)
		if params["send_by"] == "Now"
			phone = params["phone"]
			recemail = params["recemail"]
			message = params["message"]
			item_name = params["item_name"]
			
			send_now = [{"phone"=>phone, "recemail"=>recemail, "item_name"=>item_name, "message"=>message}]

			if params["phone"]
				Notification.send_text_notification(send_now)
			else
				Reminder.send_email_notification(send_now).deliver_now
			end
			@list_id = params["list_id"]
			@group = find_group(@list_id)
		
			redirect_to group_lists_path([@group, @list_id]), flash: {success: "Notification sent!"}
		else
			@list_id = params["list_id"]


			@notification = Notification.new(params)
	    @notification.save
	    @group = find_group(@list_id)

	    redirect_to group_lists_path([@group,@list_id]), flash: {success: "Notification scheduled!"}
  	end
 	end

	private
		def notification_params
	    params.require(:notification).permit(:message, :phone, :send_by, :recemail, :item_id, :list_id, :item_name)
	  end

	  def find_item
	    @item = Item.find_by_id(params[:item_id])
	  end

	  def find_group(list_id)
	  	@list = List.find_by_id(list_id)
	  	@list.group
	  end

	  def formated_notification_params(notification_params)
	  	if notification_params[:phone]
			  notification_params[:phone].slice!("-")
				notification_params[:phone].slice!("-")
				phone = notification_params[:phone]
			else
				phone = notification_params[:phone]
			end
			message = notification_params[:message]
			if notification_params[:recemail]
				recemail = notification_params[:recemail]
			else 
				recemail = nil
			end
			item_id = notification_params[:item_id]
			list_id = notification_params[:list_id]
			item_name = notification_params[:item_name]
			if notification_params[:send_by] == "Now"
				send_by = "Now"
			elsif notification_params[:send_by] == "One Hour"
				send_by = DateTime.now + 1.hours
			elsif notification_params[:send_by] == "One Day"
				send_by = DateTime.now + 1.days	
			elsif notification_params[:send_by] == "One Week"
				send_by = DateTime.now + 7.days
			end

			return {"send_by"=>send_by, "phone"=>phone, "recemail"=>recemail, "message"=> message, "item_id"=> item_id, "list_id"=> list_id, "item_name"=> item_name }

	  end


end
