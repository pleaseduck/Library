class SubscribersController < ApplicationController

  def index
    if params[:library_id]
      @libraries = Library.all
      @subscribers = Subscriber.all.where(library_id: params[:library_id])
    else
      @libraries = Library.all
      @subscribers = Subscriber.all
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @subscriber = Subscriber.where(id: params[:id]).first
  end

  # GET /pages/new
  def new
    @subscriber = Subscriber.new
  end

  # GET /pages/1/edit
  def edit
    @subscriber = Subscriber.where(id: params[:id]).first
  end

  # POST /pages
  # POST /pages.json
  def create
    @subscriber = Subscriber.create(subscriber_params)
    if @subscriber.errors.empty?
      redirect_to subscriber_path(@subscriber)
    else
      render "new"
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    @subscriber = Subscriber.where(id: params[:id]).first
    @subscriber.update_attributes(subscriber_params)
    if @subscriber.errors.empty?
      redirect_to subscriber_path(@subscriber)
    else
      render "edit"
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @subscriber = Subscriber.where(id: params[:id]).first
    @subscriber.destroy
    redirect_to subscribers_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriber_params
      #params.fetch(:page, {name})
      params[:subscriber].permit(:name, :surname, :address, :phone_number,:patronymic, :ticket_number, :library_id)
    end

end
