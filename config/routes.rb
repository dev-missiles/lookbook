Rails.application.routes.draw do

  # Routes for the User:
  
  #Frontend Page Designs
  get("/front1", { :controller => "users", :action => "front1"})
  get("/front2", { :controller => "users", :action => "front2"})
  get("/front3", { :controller => "users", :action => "front3"})
  get("/front4", { :controller => "users", :action => "front4"})
  
  # Homepage
  get("/", { :controller => "users", :action => "index"})
  
  # CREATE
  get("/insert_user_record", {:controller => "users", :action => "create" })

  # READ
  get("/users", { :controller => "users", :action => "index"})
 
  get("/users/:path_id", { :controller => "users", :action => "show"})

  # UPDATE
  get("/update_user/:path_id", {:controller => "users", :action => "update" })

  # DELETE
  get("/delete_user/:path_id", {:controller => "users", :action => "destroy"})

  
  # Routes for the Cohort resource:

  # CREATE
  post("/insert_cohort", { :controller => "cohorts", :action => "create" })
          
  # READ
  get("/cohorts", { :controller => "cohorts", :action => "index" })
  
  get("/cohorts/:path_id", { :controller => "cohorts", :action => "show" })
  
  # UPDATE
  
  post("/modify_cohort/:path_id", { :controller => "cohorts", :action => "update" })
  
  # DELETE
  get("/delete_cohort/:path_id", { :controller => "cohorts", :action => "destroy" })

  #------------------------------

  # Routes for the Skill resource:

  # CREATE
  post("/insert_skill", { :controller => "skills", :action => "create" })
          
  # READ
  get("/skills", { :controller => "skills", :action => "index" })
  
  get("/skills/:path_id", { :controller => "skills", :action => "show" })
  
  # UPDATE
  
  post("/modify_skill/:path_id", { :controller => "skills", :action => "update" })
  
  # DELETE
  get("/delete_skill/:path_id", { :controller => "skills", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
      
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
