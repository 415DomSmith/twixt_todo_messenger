namespace :twixt do 
	desc "Looks for notifications to send in this interval and sends via text or email"
	task find_current_notifications: :environment do
		puts "Finding and sending relevent notifications"
		notificationsArray = Notification.find_notifications_to_send
		puts "Notification array length before: #{notificationsArray.length}"
		Notification.send_text_notification(notificationsArray)
		Reminder.send_email_notification(notificationsArray).deliver_now
		Notification.purge_old_notifications(notificationsArray)
		notificationsArray = Notification.find_notifications_to_send
		puts "Notification array length after: #{notificationsArray.length}"
	end
end

# 	desc "Send texts within scheduling period"
# 	task send_scheduled_text: :environment do
# 		puts "Sending texts scheduled for relevent period"
# 		Notification.send_text_notification(array)
# 	end

# 	desc "Send emails within scheduling period"
# 	task send_scheduled_email: :environment do
# 		puts "Sending emails scheduled for relevent period"
# 		Reminder.send_email_notification(array).deliver_now
# 	end
# end

# 0	0,3,6,9,12,15,18,21	*	*	*	cd /Users/rebeccakilberg/Documents/coding/Galvanize/14_wk/twixt && /usr/local/bin/rake RAILS_ENV=production twixt:find_current_notifications