class Event < ActiveRecord::Base

	validates :title, :date, :organizer_name, :presence => true
	validates :title, :organizer_email, :uniqueness => true
	validates :organizer_email, :format =>  { :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, :message => "format invalid." }

	before_validation :date_in_future, :on => :create

	def date_in_future
    if self[:date] < DateTime.now || self[:date] == nil
			self.errors[:base].push("Please enter a valid date.")
		end
  end

end


