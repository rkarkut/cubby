class IndexController < ApplicationController

  before_filter :authenticate_user!
   #before_filter :get_last_links
   #before_filter :get_favorites_links

  def index

    @link = Link.new
    @new_category = Category.new

    @links = Link.paginate(:page => params[:page], :per_page => 30).where(:user_id => current_user.id).order('created_at DESC')

    @categories = Category.where(:user_id => current_user.id)
  end

  def getDetails

    domain = params[:domain]

    if domain.empty?
      render json: {'error' => 'Incorrect domain'}
    end

    data = parseDomain(domain)

    render json: {'title' => data[0], 'desc' => data[1]}
  end
end
