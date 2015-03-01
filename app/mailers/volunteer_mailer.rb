class VolunteerMailer < ActionMailer::Base
  default :from => "info@springforfood.com"

  def thank_you(volunteer)
    @volunteer = volunteer
    mail(:to => volunteer.email, :from => "info@springforfood.com", :subject => "Thank you for volunteering for Spring For Food!")
  end

end
