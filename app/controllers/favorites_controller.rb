class FavoritesController < ApplicationController

    before_filter :authenticate_user! 
    before_filter :get_last_links
    before_filter :get_favorites_links

  def show

    @links = Link.paginate(:page => params[:page]).where(:user_id => current_user.id, :favorite => 1).order('created_at desc')
  end

  def create

    link = Link.find(params[:link_id])

    link.favorite = link.favorite == 0 ? 1 : 0

    if link.save

      if link.favorite == 1

        render json: [:text => 'Remove from favorites']
      else
        render json: [:text => 'Add to favorites']
      end
    else
      render json: [:error => 'Error!']
    end
  end
end
