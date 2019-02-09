class SessionStatusService
	def self.update_session(session)
		if session.users.trainee.count > 2
			session.update_attribute(:status, 1)
		elsif session.users.trainee.count > 7
			session.update_attribute(:status, 2)
		end
	end
end
