class Vocabularies::DoctorsController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :doctors

  def create
    create!{ doctors_path }
  end

  def update
    update!{ doctors_path }
  end

  protected
    def collection
      @doctors ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

