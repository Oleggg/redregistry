class Vocabularies::AccommodationsController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :accommodations

  def create
    create!{ vocabularies_accommodations_path }
  end

  def update
    update!{ vocabularies_accommodations_path }
  end

  protected
    def collection
      @accommodations ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

