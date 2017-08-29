module ApplicationHelper
	def correct_user?(user)
		current_user ==user
	end
end
