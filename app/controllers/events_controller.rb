class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_event, only: [:edit, :update, :destroy, :calendar]

  # TODO: Add a registration form for attendees.

  # GET /events
  def index
    @events = Event.includes(:activities).all
  end

  # GET /events/:slug
  def show
    @event = Event.includes(:activities)
                  .with_attached_cover_image
                  .find_by(slug: params[:slug])
    @event = EventDecorator.new(@event)
  end

  # GET /events/:slug/calendar
  def calendar
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/:slug/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/:slug
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/:slug
  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find_by(slug: params[:slug])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name, :starts_at, :ends_at, :cover_image,
                                    :total_tickets)
    end
end
