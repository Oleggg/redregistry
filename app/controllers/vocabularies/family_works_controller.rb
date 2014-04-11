class Vocabularies::FamilyWorksController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :family_works

  def create
    create!{ vocabularies_family_works_path }
  end

  def update
    update!{ vocabularies_family_works_path }
  end

  protected
    def collection
      @family_works ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

