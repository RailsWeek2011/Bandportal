class UnregisteredUsersController < ApplicationController
  # GET /unregistered_users
  # GET /unregistered_users.json
  def index
    @unregistered_users = UnregisteredUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unregistered_users }
    end
  end

  # GET /unregistered_users/1
  # GET /unregistered_users/1.json
  def show
    @unregistered_user = UnregisteredUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unregistered_user }
    end
  end

  # GET /unregistered_users/new
  # GET /unregistered_users/new.json
  def new
    @unregistered_user = UnregisteredUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unregistered_user }
    end
  end

  # GET /unregistered_users/1/edit
  def edit
    @unregistered_user = UnregisteredUser.find(params[:id])
  end

  # POST /unregistered_users
  # POST /unregistered_users.json
  def create
    @unregistered_user = UnregisteredUser.new(params[:unregistered_user])

    respond_to do |format|
      if @unregistered_user.save
        format.html { redirect_to @unregistered_user, notice: 'Unregistered user was successfully created.' }
        format.json { render json: @unregistered_user, status: :created, location: @unregistered_user }
      else
        format.html { render action: "new" }
        format.json { render json: @unregistered_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unregistered_users/1
  # PUT /unregistered_users/1.json
  def update
    @unregistered_user = UnregisteredUser.find(params[:id])

    respond_to do |format|
      if @unregistered_user.update_attributes(params[:unregistered_user])
        format.html { redirect_to @unregistered_user, notice: 'Unregistered user was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @unregistered_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unregistered_users/1
  # DELETE /unregistered_users/1.json
  def destroy
    @unregistered_user = UnregisteredUser.find(params[:id])
    @unregistered_user.destroy

    respond_to do |format|
      format.html { redirect_to unregistered_users_url }
      format.json { head :ok }
    end
  end
end
