class IndexController < ApplicationController

  before_filter :authenticate_user! 
  before_filter :get_last_links
  before_filter :get_favorites_links

  def index

    @links = Link.paginate(:page => params[:page], :per_page => 10).where(:user_id => current_user.id).order('created_at DESC')
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
