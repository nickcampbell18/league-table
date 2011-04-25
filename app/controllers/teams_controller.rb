class TeamsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  # GET /teams
  # GET /teams.xml
  def index
    @club = Club.find_by_slug(params[:club_id])
    @teams = @club.teams

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.xml
  def show
    @club = Club.find_by_slug(params[:club_id])
    @team = @club.teams.find_by_name(params[:id].upcase)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.xml
  def new
    @club = Club.find_by_slug(params[:club_id])
    @team = @club.teams.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /teams/1/edit
  def edit
    @club = Club.find_by_slug(params[:club_id])
    @team = @club.teams.find_by_name(params[:id].upcase)
  end

  # POST /teams
  # POST /teams.xml
  def create
    @club = Club.find_by_slug(params[:club_id])
    @team = @club.teams.new(params[:team])

    respond_to do |format|
      if @team.save
        format.html { redirect_to(@club, :notice => 'Team was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.xml
  def update
    @club = Club.find_by_slug(params[:club_id])
    @team = @club.teams.find_by_name(params[:id].upcase)

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to([@club, @team], :notice => 'Team was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
end
