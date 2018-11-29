class RacesController < ApplicationController
  def index
    @q = Race.ransack(params[:q])
    @races = @q.result(:distinct => true).includes(:user_races, :event, :users).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@races.where.not(:location_id_latitude => nil)) do |race, marker|
      marker.lat race.location_id_latitude
      marker.lng race.location_id_longitude
      marker.infowindow "<h5><a href='/races/#{race.id}'>#{race.user_id}</a></h5><small>#{race.location_id_formatted_address}</small>"
    end

    render("race_templates/index.html.erb")
  end

  def show
    @user_race = UserRace.new
    @race = Race.find(params.fetch("id_to_display"))

    render("race_templates/show.html.erb")
  end

  def new_form
    @race = Race.new

    render("race_templates/new_form.html.erb")
  end

  def create_row
    @race = Race.new

    @race.user_id = params.fetch("user_id")
    @race.location_id = params.fetch("location_id")
    @race.event_id = params.fetch("event_id")

    if @race.valid?
      @race.save

      redirect_back(:fallback_location => "/races", :notice => "Race created successfully.")
    else
      render("race_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_event
    @race = Race.new

    @race.user_id = params.fetch("user_id")
    @race.location_id = params.fetch("location_id")
    @race.event_id = params.fetch("event_id")

    if @race.valid?
      @race.save

      redirect_to("/events/#{@race.event_id}", notice: "Race created successfully.")
    else
      render("race_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @race = Race.find(params.fetch("prefill_with_id"))

    render("race_templates/edit_form.html.erb")
  end

  def update_row
    @race = Race.find(params.fetch("id_to_modify"))

    @race.user_id = params.fetch("user_id")
    @race.location_id = params.fetch("location_id")
    @race.event_id = params.fetch("event_id")

    if @race.valid?
      @race.save

      redirect_to("/races/#{@race.id}", :notice => "Race updated successfully.")
    else
      render("race_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_event
    @race = Race.find(params.fetch("id_to_remove"))

    @race.destroy

    redirect_to("/events/#{@race.event_id}", notice: "Race deleted successfully.")
  end

  def destroy_row
    @race = Race.find(params.fetch("id_to_remove"))

    @race.destroy

    redirect_to("/races", :notice => "Race deleted successfully.")
  end
end
