class Vocabularies::FamilyStructuresController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :family_structures

  def create
    create!{ vocabularies_family_structures_path }
  end

  def update
    update!{ vocabularies_family_structures_path }
  end

  protected
    def collection
      @family_structures ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

