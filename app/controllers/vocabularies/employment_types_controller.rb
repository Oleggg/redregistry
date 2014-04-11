class Vocabularies::EmploymentTypesController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :employment_types

  def create
    create!{ vocabularies_employment_types_path }
  end

  def update
    update!{ vocabularies_employment_types_path }
  end

  protected
    def collection
      @employment_types ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

