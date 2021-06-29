# frozen_string_literal: true

class SolicitudesController < ApplicationController
  def index
    @solicitudes = Solicitude.all
    @users = User.all
    @publications = Publication.all
  end

  def show
    @users = User.all
    @publications = Publication.all
    @solicitude = Solicitude.find(params[:id])
  end

  def new
    @solicitude = Solicitude.new
    @solicitude.publication_id = params[:publication_id]
  end

  def create
    @solicitude_params = params.require(:solicitude).permit(:content, :publication_id,
                                                            accepted: false)
    @solicitude_params[:user_id] =  current_user.id                                                       
    @solicitude = Solicitude.create(@solicitude_params)
    if @solicitude.save
      redirect_to welcome_index_path, notice: 'Solicitud enviada'
    else
      redirect_to solicitudes_new_path, notice: 'Error al crear solicitud'
    end
  end

  def edit
    @solicitude = Solicitude.find(params[:id])
  end

  def update
    @solicitudes_params = params.require(:solicitude).permit(:content, :id_user, :id_publication,
                                                             accepted: false)
    @solicitude = Solicitude.find(params[:id])
    if @solicitude.update(@solicitudes_params)
      redirect_to solicitudes_index_path, notice: 'Solicitud actualizada correctamente'
    else
      redirect_to solicitudes_edit_path(@solicitude.id), notice: 'Error al actualizar la solicitud'
    end
  end

  def accepted
    @solicitude = Solicitude.find(params[:id])
    @conversations = Conversation.all
    @buyer = User.find(@solicitude.user_id)

    contacts_buyer = @buyer.contacts
    p "ACÁ #{contacts_buyer} ---  es un array: #{contacts_buyer.instance_of?(Array)} es un string: #{contacts_buyer.instance_of?(String)}"
    if contacts_buyer.include?("#{current_user.id}") == false
      contacts_buyer.append(current_user.id)
      @buyer.update({:contacts => contacts_buyer})

      contacts_current = current_user.contacts
      contacts_current.append(@buyer.id)
      current_user.update({:contacts => contacts_current})
    end

    @publication = Publication.find(@solicitude.publication_id)
    if @solicitude.update({:accepted => true})
      @publication.update({:buyer => @buyer.id})
      @conversations.each do |conversation|
       if conversation.sender_id == current_user.id || conversation.recipient_id == current_user.id
         if conversation.sender_id == @buyer.id || conversation.recipient_id == @buyer.id
          conversation.update({:exist => true})
          @conversa = conversation
          #  redirect_to conversation_messages_path(conversation), notice: "Solicitud aceptada corectamente"
         end
       end
      end
    end
  end

  def delete
    @solicitude = Solicitude.find(params[:id])
    @solicitude.destroy
    redirect_to solicitudes_index_path, notice: 'Solicitud eliminada'
  end
end
