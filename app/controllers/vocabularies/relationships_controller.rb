class Vocabularies::RelationshipsController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :relationships

  def create
    create!{ vocabularies_relationships_path }
  end

  def update
    update!{ vocabularies_relationships_path }
  end

  protected
    def collection
      @relationships ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

