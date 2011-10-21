class VolunteerMailer < ActionMailer::Base
  default :from => "info@thegiftoffood.org"

  def thank_you(volunteer)
    @volunteer = volunteer
    mail(:to => volunteer.email, :subject => "Thank you for volunteering for the Gift of Food!")
  end

end
