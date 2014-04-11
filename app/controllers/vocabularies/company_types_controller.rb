class Vocabularies::CompanyTypesController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :company_types

  def create
    create!{ company_types_path }
  end

  def update
    update!{ company_types_path }
  end

  protected
    def collection
      @company_types ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

