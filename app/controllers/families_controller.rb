class FamiliesController < BaseController
  inherit_resources

  set_main_menu :cards
  set_sub_menu :families

  def index
    @page = params[:page] || 1
    families = Family.scoped
    if params[:name] && !params[:name].empty?
      families = families.where("last_name LIKE :name", :name => "%#{params[:name]}%")
    end
    if params[:address] && !params[:address].empty?
      families = families.where("address LIKE :address", :address => "%#{params[:address]}%")
    end
    @families = families.sorted.paginate(:page => @page)
    index!
  end

  def create
    create!{ collection_url }
  end

  def update
    update!{ collection_url }
  end
end

