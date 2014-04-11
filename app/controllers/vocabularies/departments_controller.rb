class Vocabularies::DepartmentsController < ApplicationController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :departments

  def create
    create!{ vocabularies_departments_path }
  end

  def update
    update!{ vocabularies_departments_path }
  end

  protected
    def collection
      @departments ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end
