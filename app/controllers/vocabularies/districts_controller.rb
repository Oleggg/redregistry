class Vocabularies::DistrictsController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :districts

  def create
    create!{ vocabularies_districts_path }
  end

  def update
    update!{ vocabularies_districts_path }
  end

  protected
    def collection
      @districts ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

