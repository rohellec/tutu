class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :build_ticket, only: [:new, :create]
  before_action :set_ticket,   only: [:show, :destroy]

  def index
    @tickets = current_user.tickets
  end

  def new
  end

  def show
  end

  def create
    if @ticket.save
      redirect_to @ticket, notice: t('.notice')
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path, notice: t('.notice')
  end

  private

  def build_ticket
    @ticket = current_user.tickets.build(ticket_params)
  end

  def set_ticket
    @ticket = current_user.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :base_station_id, :final_station_id,
                                   :passenger)
  end
end
