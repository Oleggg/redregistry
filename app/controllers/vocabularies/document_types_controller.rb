class Vocabularies::DocumentTypesController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :document_types

  def create
    create!{ vocabularies_document_types_path }
  end

  def update
    update!{ vocabularies_document_types_path }
  end

  protected
    def collection
      @document_types ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

