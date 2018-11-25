class RacesHomepagesController < ApplicationController
  def index
    @races_homepages = RacesHomepage.all

    render("races_homepage_templates/index.html.erb")
  end

  def show
    @races_homepage = RacesHomepage.find(params.fetch("id_to_display"))

    render("races_homepage_templates/show.html.erb")
  end

  def new_form
    @races_homepage = RacesHomepage.new

    render("races_homepage_templates/new_form.html.erb")
  end

  def create_row
    @races_homepage = RacesHomepage.new

    @races_homepage.race_id = params.fetch("race_id")
    @races_homepage.user_id = params.fetch("user_id")
    @races_homepage.location_id = params.fetch("location_id")

    if @races_homepage.valid?
      @races_homepage.save

      redirect_back(:fallback_location => "/races_homepages", :notice => "Races homepage created successfully.")
    else
      render("races_homepage_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_race
    @races_homepage = RacesHomepage.new

    @races_homepage.race_id = params.fetch("race_id")
    @races_homepage.user_id = params.fetch("user_id")
    @races_homepage.location_id = params.fetch("location_id")

    if @races_homepage.valid?
      @races_homepage.save

      redirect_to("/races/#{@races_homepage.race_id}", notice: "RacesHomepage created successfully.")
    else
      render("races_homepage_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_location
    @races_homepage = RacesHomepage.new

    @races_homepage.race_id = params.fetch("race_id")
    @races_homepage.user_id = params.fetch("user_id")
    @races_homepage.location_id = params.fetch("location_id")

    if @races_homepage.valid?
      @races_homepage.save

      redirect_to("/locations/#{@races_homepage.location_id}", notice: "RacesHomepage created successfully.")
    else
      render("races_homepage_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @races_homepage = RacesHomepage.find(params.fetch("prefill_with_id"))

    render("races_homepage_templates/edit_form.html.erb")
  end

  def update_row
    @races_homepage = RacesHomepage.find(params.fetch("id_to_modify"))

    @races_homepage.race_id = params.fetch("race_id")
    @races_homepage.user_id = params.fetch("user_id")
    @races_homepage.location_id = params.fetch("location_id")

    if @races_homepage.valid?
      @races_homepage.save

      redirect_to("/races_homepages/#{@races_homepage.id}", :notice => "Races homepage updated successfully.")
    else
      render("races_homepage_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_race
    @races_homepage = RacesHomepage.find(params.fetch("id_to_remove"))

    @races_homepage.destroy

    redirect_to("/races/#{@races_homepage.race_id}", notice: "RacesHomepage deleted successfully.")
  end

  def destroy_row_from_user
    @races_homepage = RacesHomepage.find(params.fetch("id_to_remove"))

    @races_homepage.destroy

    redirect_to("/users/#{@races_homepage.user_id}", notice: "RacesHomepage deleted successfully.")
  end

  def destroy_row_from_location
    @races_homepage = RacesHomepage.find(params.fetch("id_to_remove"))

    @races_homepage.destroy

    redirect_to("/locations/#{@races_homepage.location_id}", notice: "RacesHomepage deleted successfully.")
  end

  def destroy_row
    @races_homepage = RacesHomepage.find(params.fetch("id_to_remove"))

    @races_homepage.destroy

    redirect_to("/races_homepages", :notice => "Races homepage deleted successfully.")
  end
end
