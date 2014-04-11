class Vocabularies::ChildCharactersController < ApplicationController
#class ChildCharacterController < ApplicationController
  inherit_resources

  set_main_menu :vocabularies
  set_sub_menu :child_characters

  def create
    create!{ vocabularies_child_characters_path }
  end

  def update
    update!{ vocabularies_child_characters_path }
  end

  protected
    def collection
      @child_characters ||= end_of_association_chain.sorted.paginate(:page => params[:page])
    end
end
