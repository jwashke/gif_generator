class FavoritesController < ApplicationController

  def create
    current_user.favorites.create(user_id: current_user.id, gif_id: params[:gif_id])
    redirect_to current_user
  end

  def destroy
    current_user.favorites.find_by(gif: params[:gif]).destroy
    redirect_to current_user
  end
end
