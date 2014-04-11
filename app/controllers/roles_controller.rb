class RolesController < BaseController
  inherit_resources

  set_main_menu :settings
  set_sub_menu :roles

  def create
    create!{ roles_path }
  end

  def update
    update!{ roles_path }
  end

  protected  
    def collection
      @roles ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

