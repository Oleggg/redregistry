class Vocabularies::CategoriesController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :categories

  def create
    create!{ vocabularies_categories_path }
  end

  def update
    update!{ vocabularies_categories_path }
  end

  protected
    def collection
      @categories ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

