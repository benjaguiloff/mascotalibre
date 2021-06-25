# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @publications = Publication.all
  end
end
