class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    set_ticket_info(user, ticket)
    mail(to: @user.email)
  end

  def destroy_ticket(user, ticket)
    set_ticket_info(user, ticket)
    mail(to: @user.email)
  end

  private

  def set_ticket_info(user, ticket)
    @user = user
    @ticket = ticket
  end
end
