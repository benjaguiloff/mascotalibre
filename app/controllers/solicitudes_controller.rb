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
  end

  def create
    @solicitude_params = params.require(:solicitude).permit(:content, :id_user, :id_publication, accepted: false)
    @solicitude = Solicitude.create(@solicitude_params)
    if @solicitude.save
      redirect_to solicitudes_index_path, notice: 'Solicitud enviada'
    else
      redirect_to solicitudes_new_path, notice: 'Error al crear solicitud'
    end
  end

  def edit
    @solicitude = Solicitude.find(params[:id])
  end

  def update
    @solicitudes_params = params.require(:solicitude).permit(:content, :id_user, :id_publication, accepted: false)
    @solicitude = Solicitude.find(params[:id])
    if @solicitude.update(@solicitudes_params)
      redirect_to solicitudes_index_path, notice: 'Solicitud actualizada correctamente'
    else
      redirect_to solicitudes_edit_path(@solicitude.id), notice: 'Error al actualizar la solicitud'
    end
  end

  def delete
    @solicitude = Solicitude.find(params[:id])
    @solicitude.destroy
    redirect_to solicitudes_index_path, notice: 'Solicitud eliminada'
  end


end
