class MessagesController < ApplicationController
    def index
      @messages = Message.all
    end
  
    def show
      @message = Message.find(params[:id])
    end
  
    def new
      @message = Message.new
    end
    def create
      @message_params = params.require(:message).permit(:email_emisor, :email_receptor, :body)
      @message = Message.create(@message_params)
      if @message.save
        redirect_to messages_new_path, notice: 'Mensaje creado correctamente'
      else
        redirect_to messages_new_path, notice: 'Mensaje no creado'
      end
    end 
    def edit
      @message = Message.find(params[:id])
    end 
    def update
      @message = Message.find(params[:id])
      @messages_params = params.require(:message).permit(:email_emisor, :email_receptor, :body)
  
      if @message.update(@messages_params)
        redirect_to messages_index_path, notice: "El mensaje ha sido editado correctamente"
      else
        redirect_to messages_index_path, notice: "Error al editar el mensaje"
      end
    end
  
    def delete
      @message = Message.find(params[:id])
      @message.destroy
      redirect_to messages_index_path, notice: "El mensaje ha sido eliminado"
    end
  end