class Vocabularies::PrivacyDocumentTypesController < BaseController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :privacy_document_types

  def create
    create!{ vocabularies_privacy_document_types_path }
  end

  def update
    update!{ vocabularies_privacy_document_types_path }
  end

  protected
    def collection
      @privacy_document_types ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end

