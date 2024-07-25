class ParticipantsController < ApplicationController
    def index
      @participants = Participant.all
      render json: @participants
    end
  
    def show
      @participant = Participant.find(params[:id])
      render json: @participant
    end
  
    def create
      @participant = Participant.new(participant_params)
      if @participant.save
        render json: @participant, status: :created
      else
        render json: @participant.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @participant = Participant.find(params[:id])
      @participant.destroy
      head :no_content
    end
  
    def my_events
      @participant = Participant.find(params[:id])
      render json: @participant.events
    end
  
    private
  
    def participant_params
      params.require(:participant).permit(:name, :email, :event_id)
    end
  end
  