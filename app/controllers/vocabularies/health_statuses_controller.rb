class Vocabularies::HealthStatusesController < ApplicationController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :health_statuses

  def create
    create!{ vocabularies_health_statuses_path }
  end

  def update
    update!{ vocabularies_health_statuses_path }
  end

  protected
    def collection
      @health_statuses ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end
