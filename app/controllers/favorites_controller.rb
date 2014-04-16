class FavoritesController < ApplicationController

    before_filter :authenticate_user! 
    before_filter :get_last_links
    before_filter :get_favorites_links

  def show

    @links = Link.paginate(:page => params[:page]).where(:user_id => current_user.id, :favorite => 1).order('created_at desc')
  end
end
