class TicketsController < ApplicationController

    def create
        ticket = Ticket.create(ticket_params)
        
        if ticket 
            render json: ticket
        else 
            render json: {error: "Unauthorized request"}        
        end 

    end 

    def index
        tickets = Ticket.all
        render json: tickets
    end 

    def destroy
        ticket = Ticket.find_by(id: params[:id])
        ticket.destroy

        if ticket
            render json: {success: 'Sucessfully deleted'}
        else 
            render json: {errors: 'Ticket still exists'}
        end 

    end

    private 
    def ticket_params 
        params.permit(:user_id, :event_id)
    end 

end
