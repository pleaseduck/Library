class PagesController < ApplicationController

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  def index

    @page = Page.all

  end

  def edit

    @page = Page.find(params[:id])

  end

  def update

    @page = Page.find(params[:id])
    if @page.update(page_params)
      redirect_to pages_path
    else
      render :edit
    end
  end


  def destroy

      @page = Page.find(params[:id])
      if @page.destroy
        redirect_to pages_path
      else
        redirect_to pages_path, error: 'Что-то пошло не так'
      end

  end

  def show
    @page = Page.find(params[:id])
  end
  private
    def page_params
      params[:page].permit(:name, :description)
    end
end
