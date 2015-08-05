# ==========================================================================
# ==== MODEL METHODS TO HANDLE FINDING NOTIFICATIONS DUE TO BE =============
# ====    SENT OUT, SENDING THEM, AND REMOVING FROM DB         =============
# ==========================================================================

class Notification < ActiveRecord::Base

	require 'twilio-ruby'

	def self.find_notifications_to_send
		notifications_to_send = Notification.where('send_by < ?', DateTime.now.utc)
	end

	def self.send_text_notification(array)
		client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token  
		unless array.length == 0
			array.each do |notification|
				if notification["message"] == nil || notification["message"] == ""
					client.account.messages.create({
						:from => '+14154814661', 
						:to => '+1' + notification["phone"], 
						:body => "Twixt App is contacting you to remind you about " + notification["item_name"],  
					})	
				else
					client.account.messages.create({
						:from => '+14154814661', 
						:to => '+1' + notification["phone"], 
						:body => "Twixt App is contacting you to remind you about " + notification["message"] ,  
					})	
				end
			end	
		end	
	end

	def send_notification_to_group
		# if ready_to_send array has elements, array.each 
		# item= Item.find_by_id(notification.id)
		# list = item.list
		# group = list.group
		# recipients = group.users

		# if user has phone, send_text_notification
		# else send_email_notification
	end

	def self.purge_old_notifications(array)
		array.each do |notification|
			# delete_this = Notification.find_by_id(notification["id"])
			notification.destroy
		end
	end

end
