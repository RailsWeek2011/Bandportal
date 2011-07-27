class CandidaturesController < ApplicationController
  # GET /candidatures
  # GET /candidatures.json
  def index
    @candidatures = Candidature.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @candidatures }
    end
  end

  # GET /candidatures/1
  # GET /candidatures/1.json
  def show
    @candidature = Candidature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @candidature }
    end
  end

  # GET /candidatures/new
  # GET /candidatures/new.json
  def new
    @candidature = Candidature.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @candidature }
    end
  end

  # GET /candidatures/1/edit
  def edit
    @candidature = Candidature.find(params[:id])
  end

  # POST /candidatures
  # POST /candidatures.json
  def create
    @candidature = Candidature.new(params[:candidature])

    respond_to do |format|
      if @candidature.save
        format.html { redirect_to @candidature, notice: 'Candidature was successfully created.' }
        format.json { render json: @candidature, status: :created, location: @candidature }
      else
        format.html { render action: "new" }
        format.json { render json: @candidature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /candidatures/1
  # PUT /candidatures/1.json
  def update
    @candidature = Candidature.find(params[:id])

    respond_to do |format|
      if @candidature.update_attributes(params[:candidature])
        format.html { redirect_to @candidature, notice: 'Candidature was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @candidature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidatures/1
  # DELETE /candidatures/1.json
  def destroy
    @candidature = Candidature.find(params[:id])
    @candidature.destroy

    respond_to do |format|
      format.html { redirect_to candidatures_url }
      format.json { head :ok }
    end
  end
end
