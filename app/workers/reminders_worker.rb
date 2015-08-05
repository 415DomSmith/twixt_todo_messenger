class RemindersWorker
	include Sidekiq::Worker 

	def perform(reminder_id)
		reminder = Reminder.find_by_id (reminder_id)
		

	end 
end