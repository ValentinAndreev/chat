class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set, except: [:index, :new, :create]

  def index
    @chatrooms = Chatroom.all
  end

  def show 
    @chatroom_user = current_user.chatroom_users.find_by(chatroom_id: @chatroom.id)
    @messages = @chatroom.messages.order(created_at: :desc).limit(100).reverse
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
    @chatroom.chatroom_users.destroy_all
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
