class TendersController < ApplicationController
  # GET /tenders
  # GET /tenders.json
  def index
    @tenders = Tender.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tenders }
    end
  end

  def active
    @tenders = Tender.where(:ended => false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tenders }
    end
  end

  # GET /tenders/1
  # GET /tenders/1.json
  def show
    @tender = Tender.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tender }
    end
  end

  # GET /tenders/new
  # GET /tenders/new.json
  def new
    @tender = Tender.new

    if params[:event_id].nil?
      @event_id = nil
    else
      @event_id = params[:event_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tender }
    end
  end

  # GET /tenders/1/edit
  def edit
    @tender = Tender.find(params[:id])

    @event_id = @tender.event_id
  end

  # POST /tenders
  # POST /tenders.json
  def create
    @tender = Tender.new(params[:tender])

    respond_to do |format|
      if @tender.save
        format.html { redirect_to @tender, notice: 'Tender was successfully created.' }
        format.json { render json: @tender, status: :created, location: @tender }
      else
        format.html { render action: "new" }
        format.json { render json: @tender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tenders/1
  # PUT /tenders/1.json
  def update
    @tender = Tender.find(params[:id])

    respond_to do |format|
      if @tender.update_attributes(params[:tender])
        format.html { redirect_to @tender, notice: 'Tender was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenders/1
  # DELETE /tenders/1.json
  def destroy
    @tender = Tender.find(params[:id])
    @tender.destroy

    respond_to do |format|
      format.html { redirect_to tenders_url }
      format.json { head :ok }
    end
  end
end
