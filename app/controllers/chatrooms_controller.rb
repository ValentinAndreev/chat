# frozen_string_literal: true
class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set, except: [:index, :new, :create]

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom_user = current_user.chatroom_users.find_by(chatroom_id: @chatroom.id)
    @messages = @chatroom.messages.order(created_at: :desc).limit(100).reverse
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def edit; end

  def update
    @chatroom.update_attributes!(chatroom_params)
    redirect_to '/', notice: 'Name of chatroom was changed.'
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.user_id = current_user.id
    if @chatroom.save 
      redirect_to '/', notice: 'Chatroom was created.'
    else
      render 'new'
    end
  end

  def destroy
    @chatroom.chatroom_users.destroy_all
    @chatroom.messages.destroy_all
    @chatroom.destroy
    redirect_to '/', notice: 'Chatroom was deleted.'
  end

  private

  def set
    @chatroom = Chatroom.find_by_id(params[:id])
    redirect_to '/' unless @chatroom
  end

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
