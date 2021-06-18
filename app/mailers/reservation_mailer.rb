class ReservationMailer < ApplicationMailer
  default from: 'goudinlucas@gmail.com'

  def reservation_confirmation_email
    @user = params[:user]
    @reservation = params[:reservation]
    @flight = params[:flight]
    mail(to: @user.email, subject: "Reservation confirmation")
  end
end
