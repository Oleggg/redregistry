class Vocabularies::CcArticlesController < ApplicationController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :cc_articles

  def create
    create!{ vocabularies_cc_articles_path }
  end

  def update
    update!{ vocabularies_cc_articles_path }
  end

  protected
    def collection
      @cc_articles ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end
