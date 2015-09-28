module BookedTicketsHelper
	def get_status(passenger)
		passenger.status ? "Confirmed" : "Cancelled"
	end
end
