class FrontController < BaseController

  def index
    #@page = params[:page] || 1
    #uics = Uic.scoped
    #@UICs = uics.scoped.paginate(:page => @page)
    @total_subscribers = Subscriber.count
    @houses = House.scoped
    @electoral_districts = ElectoralDistrict.scoped
    @region_committees = RegionCommittee.scoped
    #@graph

    render :layout => "front"
  end

end
