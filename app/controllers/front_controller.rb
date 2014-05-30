class FrontController < BaseController

  def index
    #@page = params[:page] || 1
    #uics = Uic.scoped
    #@UICs = uics.scoped.paginate(:page => @page)
    @total_subscribers = Subscriber.count
    @electoral_districts = ElectoralDistrict.scoped
    @houses = House.scoped
    @electoral_districts = ElectoralDistrict.scoped
    @region_committees = RegionCommittee.scoped
    @uics = Uic.scoped
    #@graph

    render :layout => "front"
  end

end
