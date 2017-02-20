class ChatroomsController < ApplicationController
  before_action :set, except: [:index, :new, :create]

  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end

  def edit ; end

  def update
    @chatroom.update_attributes!(chatroom_params)
    redirect_to '/'    
  end

  def create
    @chatroom = Chatroom.create!(chatroom_params)
    redirect_to '/'
  end

  def destroy
    @chatroom.destroy
    redirect_to '/'
  end

  private

  def set
    @chatroom = Chatroom.find(params[:id])
  end

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
