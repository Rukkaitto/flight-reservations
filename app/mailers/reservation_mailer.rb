class ReservationMailer < ApplicationMailer
  default from: 'goudinlucas@gmail.com'

  def reservation_confirmation_email
    @user = params[:user]
    @reservation = params[:reservation]
    @flight = params[:flight]

    attachments['invoice.pdf'] = {
      mime_type: 'application/pdf',
      content: render_to_string(template: 'pdf/ticket.pdf.prawn', formats: [:pdf], locals: { :@reservation => @reservation })
    }
    mail(to: @user.email, subject: 'Reservation confirmation')
  end
end
