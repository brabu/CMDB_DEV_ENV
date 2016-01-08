class Account < ActiveRecord::Base

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :subdomain, presence: true, allow_nil: true

  before_save {self.email = email.downcase }
  
  after_create :create_tenant

  private

	def create_tenant
		Apartment::Tenant.create(subdomain)
	end
end
