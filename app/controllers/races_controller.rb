class RacesController < ApplicationController
  before_action :current_user_must_be_race_participant, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_race_participant
    race = Race.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == race.participant
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @races = Race.all

    render("race_templates/index.html.erb")
  end

  def show
    @races_homepage = RacesHomepage.new
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

  def create_row_from_location
    @race = Race.new

    @race.user_id = params.fetch("user_id")
    @race.location_id = params.fetch("location_id")
    @race.event_id = params.fetch("event_id")

    if @race.valid?
      @race.save

      redirect_to("/locations/#{@race.location_id}", notice: "Race created successfully.")
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

    
    @race.location_id = params.fetch("location_id")
    @race.event_id = params.fetch("event_id")

    if @race.valid?
      @race.save

      redirect_to("/races/#{@race.id}", :notice => "Race updated successfully.")
    else
      render("race_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_participant
    @race = Race.find(params.fetch("id_to_remove"))

    @race.destroy

    redirect_to("/users/#{@race.user_id}", notice: "Race deleted successfully.")
  end

  def destroy_row_from_city
    @race = Race.find(params.fetch("id_to_remove"))

    @race.destroy

    redirect_to("/locations/#{@race.location_id}", notice: "Race deleted successfully.")
  end

  def destroy_row
    @race = Race.find(params.fetch("id_to_remove"))

    @race.destroy

    redirect_to("/races", :notice => "Race deleted successfully.")
  end
end
