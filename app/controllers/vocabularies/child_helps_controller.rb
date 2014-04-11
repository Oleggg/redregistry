class Vocabularies::ChildHelpsController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :child_helps

  def create
    create!{ vocabularies_child_helps_path }
  end

  def update
    update!{ vocabularies_child_helps_path }
  end

  protected
    def collection
      @child_helps ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

