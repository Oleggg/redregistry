class Vocabularies::RegionsController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :regions

  def create
    create!{ vocabularies_regions_path }
  end

  def update
    update!{ vocabularies_regions_path }
  end

  protected
    def collection
      @regions ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

