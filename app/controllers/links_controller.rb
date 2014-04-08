class LinksController < ApplicationController

  def show

    link = Link.find_by_id(params[:id])

    link.counter += 1

    if link.save

      uri = URI.parse(link.url)
      
      if uri.kind_of?(URI::HTTP) or uri.kind_of?(URI:HTTPS)
        
        redirect_to link.url
      end

    else
      redirect_to root_path, :notice => 'Somethig goes wrong'
    end
  end

  def new
    if params[:category].nil?

      @category = Category.new
    else
      @category = Category.find(params[:category])
    end

    @categories = Category.find_all_by_user_id(current_user.id)

    @link = Link.new
  end

  def edit

    @link = Link.find(params[:id])
    @categories = Category.find_all_by_user_id(current_user.id)
  end

  def update

    @link = Link.find(params[:id])

    if @link.update_attributes params[:link]

      @category = Category.find(@link.category_id)
      redirect_to @category, notice: 'Link has been saved'
    else

      @categories = Category.find_all_by_user_id(current_user.id)

      flash[:alert] = @link.errors.full_messages.first
      render action: 'edit'
    end
  end

  def destroy

    link = Link.find(params[:id])

    category = Category.find(link.category_id)
    
    link.destroy
    redirect_to category_path(category), :notice => "You destroyed a link"
  end

  def create

    if params[:category].nil?

      @category = Category.new
    else
      @category = Category.find(params[:category])
    end

    @categories = Category.find_all_by_user_id(current_user.id)

    @link = Link.new(params[:link])
    @link.user = current_user
    @link.category = Category.find(params[:link][:category_id])

    if @link.save

      redirect_to new_link_path, notice: 'Link has been saved'
    else

      flash[:alert] = @link.errors.full_messages.first
      render action: 'new'
    end
  end
end
