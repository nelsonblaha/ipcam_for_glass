class ZonesController < ApplicationController
  before_action :check_owner, except: [:index, :new, :create]

  # GET /zones
  def index
    if current_user
      @zones = current_user.zones
    else
      @zones = []
    end
  end

  # GET /zones/1
  def show
  end

  # GET /zones/new
  def new
    @zone = Zone.new
  end

  # GET /zones/1/edit
  def edit
  end

  # POST /zones
  def create
    @zone = Zone.new(zone_params)
    @zone.user_id = current_user.id

    if @zone.save
      redirect_to @zone, notice: 'Zone was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /zones/1
  def update
    @zone.user_id = current_user.id
    if @zone.update(zone_params)
      redirect_to @zone, notice: 'Zone was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /zones/1
  def destroy
    @zone.destroy
    redirect_to zones_url, notice: 'Zone was successfully destroyed.'
  end

  private

    # Only allow a trusted parameter "white list" through.
    def zone_params
      params.require(:zone).permit(:name, :user_id, :camera_id, :latitude, :longitude, :radius, :triggered)
    end

    def check_owner
      @zone = Zone.find(params[:id])
      unless current_user && current_user == @zone.user
        redirect_to root_url
      end
    end
end
