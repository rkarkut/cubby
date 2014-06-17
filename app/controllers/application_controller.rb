class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :init_app
  

  include ApplicationHelper

  def init_app

      @new_link = Link.new
      @new_category = Category.new

      if user_signed_in?
          
          @user_categories = Category.where(:user_id => current_user.id)
      end
      
  end

  def get_last_links

    @latests_links = Link.where(:user_id => current_user.id).order('created_at DESC').limit(10)
  end

  def get_favorites_links

    @favorites_links = Link.where(:user_id => current_user.id, :favorite => 1).order('created_at DESC').limit(10)
  end
end
