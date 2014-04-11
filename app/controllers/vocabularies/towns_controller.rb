class Vocabularies::TownsController < ApplicationController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :towns

  def create
    create!{ vocabularies_towns_path }
  end

  def update
    update!{ vocabularies_towns_path }
  end

  protected
    def collection
      @towns ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end
