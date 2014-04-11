class Vocabularies::CitiesController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :cities

  def create
    create!{ vocabularies_cities_path }
  end

  def update
    update!{ vocabularies_cities_path }
  end

  protected
    def collection
      @cities ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

