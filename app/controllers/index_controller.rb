class IndexController < ApplicationController

  def index

    @links = Link.last(10)
  end

  def index2

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
