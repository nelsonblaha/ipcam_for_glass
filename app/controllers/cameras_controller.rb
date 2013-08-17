class CamerasController < ApplicationController
  before_action :check_owner, except: [:new,:create,:index]

  # GET /cameras
  def index
    if current_user
      @cameras = current_user.cameras
    else
      @cameras = []
    end
  end

  # GET /cameras/1
  def show
  end

  # GET /cameras/new
  def new
    @camera = Camera.new
  end

  # GET /cameras/1/edit
  def edit
  end

  # POST /cameras
  def create
    @camera = Camera.new(camera_params)
    @camera.user_id = current_user.id

    if @camera.save
      redirect_to @camera, notice: 'Camera was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /cameras/1
  def update
    @camera.user_id = current_user.id
    if @camera.update(camera_params)
      redirect_to @camera, notice: 'Camera was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /cameras/1
  def destroy
    @camera.destroy
    redirect_to cameras_url, notice: 'Camera was successfully destroyed.'
  end

  private

    # Only allow a trusted parameter "white list" through.
    def camera_params
      params.require(:camera).permit(:url, :name, :privacy, :username, :password)
    end

    def check_owner
      @camera = Camera.find(params[:id])
      unless current_user && current_user == @camera.user
        redirect_to root_url
      end
    end
end
