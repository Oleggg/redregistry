class Vocabularies::FamilyHelpsController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :family_helps

  def create
    create!{ vocabularies_family_helps_path }
  end

  def update
    update!{ vocabularies_family_helps_path }
  end

  protected
    def collection
      @family_helps ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

