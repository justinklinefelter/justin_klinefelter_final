Rails.application.routes.draw do
  # Routes for the Races homepage resource:

  # CREATE
  get("/races_homepages/new", { :controller => "races_homepages", :action => "new_form" })
  post("/create_races_homepage", { :controller => "races_homepages", :action => "create_row" })

  # READ
  get("/races_homepages", { :controller => "races_homepages", :action => "index" })
  get("/races_homepages/:id_to_display", { :controller => "races_homepages", :action => "show" })

  # UPDATE
  get("/races_homepages/:prefill_with_id/edit", { :controller => "races_homepages", :action => "edit_form" })
  post("/update_races_homepage/:id_to_modify", { :controller => "races_homepages", :action => "update_row" })

  # DELETE
  get("/delete_races_homepage/:id_to_remove", { :controller => "races_homepages", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
