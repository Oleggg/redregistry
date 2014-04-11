class Vocabularies::UnregistrationCausesController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :unregistration_causes

  def create
    create!{ vocabularies_unregistration_causes_path }
  end

  def update
    update!{ vocabularies_unregistration_path }
  end

  protected
    def collection
      @unregistration_causes ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

