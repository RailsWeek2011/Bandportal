class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    @sup_ag_groups = Array.new

    @event.artist_groups.each do |ag|
      @sup_ag_groups << Group.where("groupable_type = 'ArtistGroup' AND groupable_id = ?", ag.id).first
    end

    @tenders = Tender.where("event_id = ?", @event.id).order("ended")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  def add_program_item
    pi = ProgramItem.new
    pi.artist_group_id  = params[:art_id]
    pi.event_id         = params[:event_id]
    pi.save

    redirect_to event_path(:id => params[:event_id])
  end

  def remove_program_item
    pi = ProgramItem.where("artist_group_id = ? AND event_id = ?", params[:artist_id], params[:event_id]).first
    pi.destroy

    redirect_to event_path(:id => params[:event_id])
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    if params[:host_id].nil?
      @host_id = nil
    else
      @host_id = params[:host_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])

    @host_id = @event.host_group_id
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    #@event.host_group = HostGroup.find(params[:host_group])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end
end
