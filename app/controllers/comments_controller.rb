# frozen_string_literal: true

class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
    @comment.publication_id = params[:publication_id]
  end

  def create
    @comment_params = params.require(:comment).permit(:contents, :publication_id)
    @comment_params[:user_id] = current_user.id
    @comment = Comment.create(@comment_params)
    if @comment.save
      redirect_to publications_show_path(@comment_params[:publication_id]),
                  notice: 'Comentario creado correctamente'
    else
      redirect_to comments_new_path, notice: 'Error al crear el comentario'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment_params = params.require(:comment).permit(:contents)
    if @comment.update(@comment_params)
      redirect_to comments_show_path, notice: 'Comentario editado correctamente'
    else
      redirect_to comments_index_path, notice: 'Error al editar el comentario'
    end
  end

  def delete
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_index_path, notice: 'El comentario ha sido eliminada'
  end
end
