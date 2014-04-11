class Vocabularies::StreetsController < ApplicationController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :streets

  def create
    create!{ vocabularies_streets_path }
  end

  def update
    update!{ vocabularies_streets_path }
  end

  protected
    def collection
      @streets ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end
