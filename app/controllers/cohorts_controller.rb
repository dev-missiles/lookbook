class CohortsController < ApplicationController
  def index
    matching_cohorts = Cohort.all

    @list_of_cohorts = matching_cohorts.order({ :created_at => :desc })

    render({ :template => "cohorts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_cohorts = Cohort.where({ :id => the_id })

    @the_cohort = matching_cohorts.at(0)

    render({ :template => "cohorts/show.html.erb" })
  end

  def create
    the_cohort = Cohort.new
    the_cohort.cohort_start = params.fetch("query_cohort_start")
    the_cohort.name = params.fetch("query_name")
    the_cohort.cohort_end = params.fetch("query_cohort_end")

    if the_cohort.valid?
      the_cohort.save
      redirect_to("/cohorts", { :notice => "Cohort created successfully." })
    else
      redirect_to("/cohorts", { :alert => the_cohort.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_cohort = Cohort.where({ :id => the_id }).at(0)

    the_cohort.cohort_start = params.fetch("query_cohort_start")
    the_cohort.name = params.fetch("query_name")
    the_cohort.cohort_end = params.fetch("query_cohort_end")

    if the_cohort.valid?
      the_cohort.save
      redirect_to("/cohorts/#{the_cohort.id}", { :notice => "Cohort updated successfully."} )
    else
      redirect_to("/cohorts/#{the_cohort.id}", { :alert => the_cohort.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_cohort = Cohort.where({ :id => the_id }).at(0)

    the_cohort.destroy

    redirect_to("/cohorts", { :notice => "Cohort deleted successfully."} )
  end
end
