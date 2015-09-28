class Passenger < ActiveRecord::Base
	belongs_to :ticket, :class_name => "Ticket", :dependent => :destroy 

    validates :name, presence: true,  length: { maximum: 30 }
    validates :age, presence: true, numericality: {in: 1..99}

    before_create :set_status

    after_update :cancel_ticket

    def cancel
        self.status = false
        self.save
    end
    
    private

    def set_status
       self.status = true
    end

    def cancel_ticket
        self.ticket.count_cancel+=1
        self.ticket.journey.booked -=1
        amount_to_refund = ticket.journey.route.fare - 100
        self.ticket.fare = self.ticket.fare - amount_to_refund
        self.ticket.save
        self.ticket.journey.save
    end 
end
