class Vocabularies::FamilyTypesController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :family_types

  def create
    create!{ vocabularies_family_types_path }
  end

  def update
    update!{ vocabularies_family_types_path }
  end

  protected
    def collection
      @family_types ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

