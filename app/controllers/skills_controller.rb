class SkillsController < ApplicationController
  def index
    matching_skills = Skill.all

    @list_of_skills = matching_skills.order({ :created_at => :desc })

    render({ :template => "skills/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_skills = Skill.where({ :id => the_id })

    @the_skill = matching_skills.at(0)
 
    render({ :template => "skills/show.html.erb" })
  end

  def create
    the_skill = Skill.new
    the_skill.prior_skills = params.fetch("query_prior_skills")
    the_skill.user_id = params.fetch("query_user_id")
    the_skill.current_skills = params.fetch("query_current_skills")
    the_skill.field_of_interest = params.fetch("query_field_of_interest")
    the_skill.github_link = params.fetch("query_github_link")
    the_skill.portfolio_link = params.fetch("query_portfolio_link")
    the_skill.linkedin_link = params.fetch("query_linkedin_link")

    if the_skill.valid?
      the_skill.save
      redirect_to("/skills", { :notice => "Skill created successfully." })
    else
      redirect_to("/skills", { :alert => the_skill.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_skill = Skill.where({ :id => the_id }).at(0)

    the_skill.prior_skills = params.fetch("query_prior_skills")
    the_skill.user_id = params.fetch("query_user_id")
    the_skill.current_skills = params.fetch("query_current_skills")
    the_skill.field_of_interest = params.fetch("query_field_of_interest")
    the_skill.github_link = params.fetch("query_github_link")
    the_skill.portfolio_link = params.fetch("query_portfolio_link")
    the_skill.linkedin_link = params.fetch("query_linkedin_link")

    if the_skill.valid?
      the_skill.save
      redirect_to("/skills/#{the_skill.id}", { :notice => "Skill updated successfully."} )
    else
      redirect_to("/skills/#{the_skill.id}", { :alert => the_skill.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_skill = Skill.where({ :id => the_id }).at(0)

    the_skill.destroy

    redirect_to("/skills", { :notice => "Skill deleted successfully."} )
  end
end
