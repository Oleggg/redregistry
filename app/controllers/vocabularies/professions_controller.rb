class Vocabularies::ProfessionsController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :professions

  def create
    create!{ vocabularies_professions_path }
  end

  def update
    update!{ vocabularies_professions_path }
  end

  protected
    def collection
      @professions ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

