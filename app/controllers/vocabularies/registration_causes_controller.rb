class Vocabularies::RegistrationCausesController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :registration_causes

  def create
    create!{ vocabularies_registration_causes_path }
  end

  def update
    update!{ vocabularies_registration_causes_path }
  end

  protected
    def collection
      @registration_causes ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

