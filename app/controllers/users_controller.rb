class UsersController < ApplicationController
  #frontend design areas change file name to a specific area you are working one.
  def front1
    render({ :template => "users/frontend_1.html.erb"})
  end
  def front2
    render({ :template => "users/frontend_2.html.erb"})
  end
  def front3
    render({ :template => "users/frontend_3.html.erb"})
  end
  def front4
    render({ :template => "users/frontend_4.html.erb"})
  end
  
  def index
    matching_users = User.all
    @list_of_users = matching_users.order(:last_name)
    render({ :template => "users/index.html.erb" })
  end
  def show
    the_id = params.fetch("path_id")

    matching_users = User.where({ :id => the_id })

    @the_user = matching_users.at(0)

    matching_skills = Skill.where({ :user_id  => the_id })

    @the_skill = matching_skills.at(0)

    render({ :template => "users/show.html.erb" })
  end
  def create
    @user = User.new
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.first_name = params.fetch("query_first_name")
    @user.last_name = params.fetch("query_last_name")
    @user.image = params.fetch("query_image")
    @user.cohort_id = params.fetch("query_cohort_id")

    save_status = @user.save

    if save_status == true
      session[:user_id] = @user.id
   
      redirect_to("/", { :notice => "User account created successfully."})
    else
      redirect_to("/user_sign_up", { :alert => @user.errors.full_messages.to_sentence })
    end
  end
    
  def edit_profile_form
    render({ :template => "user_authentication/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.first_name = params.fetch("query_first_name")
    @user.last_name = params.fetch("query_last_name")
    @user.image = params.fetch("query_image")
    @user.cohort_id = params.fetch("query_cohort_id")
    
    if @user.valid?
      @user.save

      redirect_to("/", { :notice => "User account updated successfully."})
    else
      render({ :template => "user_authentication/edit_profile_with_errors.html.erb" , :alert => @user.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/", { :notice => "User account cancelled" })
  end
 
end
