class WorkersController < ApplicationController

  def index
    @workers = Worker.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @worker = Worker.where(id: params[:id]).first
  end

  # GET /pages/new
  def new
    @worker = Worker.new
  end

  # GET /pages/1/edit
  def edit
    @worker = Worker.where(id: params[:id]).first
  end

  # POST /pages
  # POST /pages.json
  def create
    @worker = Worker.create(worker_params)
    if @worker.errors.empty?
      redirect_to worker_path(@worker)
    else
      render "new"
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    @worker = Worker.where(id: params[:id]).first
    @worker.update_attributes(worker_params)
    if @worker.errors.empty?
      redirect_to worker_path(@worker)
    else
      render "edit"
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @worker = Worker.where(id: params[:id]).first
    @worker.destroy
    redirect_to workers_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      #params.fetch(:page, {name})
      params[:worker].permit(:name, :surname, :position, :library_id)
    end

end
