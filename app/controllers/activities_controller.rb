class ActivitiesController < ApplicationController
  before_action :set_event
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # GET /activities
  def index
    @activities = @event.activities.all
  end

  # GET /activities/1
  def show
  end

  # GET /activities/new
  def new
    @activity = @event.activities.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  def create
    @activity = @event.activities.new(activity_params)

    if @activity.save
      redirect_to event_path(@event),
                  notice: 'Activity was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /activities/1
  def update
    if @activity.update(activity_params)
      redirect_to @activity, notice: 'Activity was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /activities/1
  def destroy
    @activity.destroy
    redirect_to activities_url, notice: 'Activity was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = @event.activities.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    # Only allow a trusted parameter "white list" through.
    def activity_params
      params.require(:activity).permit(:event_id, :name, :description,
                                       :starts_at, :ends_at)
    end
end
