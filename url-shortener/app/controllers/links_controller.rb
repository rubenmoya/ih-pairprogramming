class LinksController < ApplicationController
  def redirect
    link = Link.handle_redirection(params[:shortlink])

    if link.nil?
      redirect_to '/'
    else
      redirect_to link.original_url
    end
  end

  def new
  end

  def show
    @link = Link.find(params[:link_id])
  end

  def create
    link =(Link.original_url_exists? params[:original_url])

    if (link.nil?)
      link = Link.new(original_url: params[:original_url], short_url: Link.random_url)

      if link.save
        redirect_to "/links/#{link.id}"
      else
        render 'new'
      end

    end

    redirect_to "/links/#{link.id}"

  end

end
