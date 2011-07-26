class GroupsController < ApplicationController

  def add_user
    @group = Group.find(params[:id])

    u = User.find(params[:user_id])

    u.groups << @group

    redirect_to @group
  end

  def add_unreg_user
    @group = Group.find(params[:id])

    u = UnregisteredUser.new
    u.prename = params[:unreg_prename]
    u.name = params[:unreg_surname]
    u.save

    u.groups << @group

    redirect_to @group
  end

  def remove_user
    @group = Group.find(params[:id])

    Membership.where("group_id = #{params[:id]}
                      AND userable_id = #{params[:user_id]}
                      AND userable_type = '#{params[:user_type]}'").first.delete

    if params[:user_type] == "UnregisteredUser"
      UnregisteredUser.find(params[:user_id]).destroy
    end

    redirect_to @group
  end

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all

    @host_groups    = Group.where "groupable_type = 'HostGroup'"
    @fan_groups     = Group.where "groupable_type = 'FanGroup'"
    @artist_groups  = Group.where "groupable_type = 'ArtistGroup'"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])

    if (@group.groupable_type == 'ArtistGroup')
      @show_class = 'Kuenstlergruppe'
    elsif (@group.groupable_type == 'FanGroup')
      @show_class = 'Fangruppe'
    elsif (@group.groupable_type == 'HostGroup')
      @show_class = 'Veranstaltergruppe'
    else
      @show_class = 'untypisierte Gruppe'
    end

    @all_registered_users = (User.all - @group.members)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :ok }
    end
  end
end
