class Vocabularies::LocationsController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :locations

  def create
    create!{ vocabularies_locations_path }
  end

  def update
    update!{ vocabularies_locations_path }
  end

  protected
    def collection
      @locations ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

