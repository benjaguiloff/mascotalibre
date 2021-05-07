class PublicationsController < ApplicationController
  def index
    @publications = Publication.all
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication_params = params.require(:publication).permit(:title, :image, :species, :typo, :price, :direction)
    @publication = Publication.create(@publication_params)
    if @publication.save
      redirect_to publications_index_path, notice: 'Publicación creada correctamente'
    else
      redirect_to publications_new_path, notice: 'Error al crear la publicación'
    end
  end

  def edit
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.find(params[:id])
    @publication_params = params.require(:publication).permit(:title, :image, :species, :typo, :price, :direction)
    if @publication.update(@publication_params)
      redirect_to publications_show_path, notice: 'Publicación editada correctamente'
    else
      redirect_to publications_index_path, notice: 'Error al editar la publicación'
    end
  end

  def delete
    @publication = Publication.find(params[:id])
    @publication.destroy
    redirect_to publications_index_path, notice: "La publicación ha sido eliminada"
    end
  end

