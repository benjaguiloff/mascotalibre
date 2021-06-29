# frozen_string_literal: true

class ReviewsController < ApplicationController

  def show
    @users = User.all
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @review.id_user =  params[:id_user]
    @review.id_reviewed =  params[:id_reviewed]
  end

  def create

    @review_params = params.require(:review).permit(:content, :id_user, :id_reviewed, :rating)

    @review = Review.create(@review_params)
    if @review.save
      redirect_to "/", notice: 'Reseña creada correctamente'
    else
      redirect_to "/", notice: 'Error al crear reseña'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @reviews_params = params.require(:review).permit(:content, :id_user, :id_reviewed)
    @review = Review.find(params[:id])
    if @review.update(@reviews_params)
      redirect_to "/", notice: 'Reseña actualizada correctamente'
    else
      redirect_to reviews_edit_path(@review.id), notice: 'Error al actualizar la reseña'
    end
  end

  def delete
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_index_path, notice: 'Reseña eliminada'
  end
end
