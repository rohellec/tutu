class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new(tickets_params)
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = Ticket.new(tickets_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  private

  def tickets_params
    params.require(:ticket).permit(:user_id, :train_id, :base_station_id, :final_station_id,
                                   :passenger)
  end
end
