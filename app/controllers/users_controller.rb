# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @reviews = Review.all
  end

  def show_posted
    @user = User.find_by(id: params[:id])
    @publications = Publication.all
  end

  def show_purchased
    @user = User.find_by(id: params[:id])
    @publications = Publication.all
  end

  def show_saved
    @user = User.find_by(id: params[:id])
    @publications = Publication.all
  end
end
