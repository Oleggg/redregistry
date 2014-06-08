class FrontController < BaseController

  def index
    #@page = params[:page] || 1
    #uics = Uic.scoped
    #@UICs = uics.scoped.paginate(:page => @page)
    @total_subscribers = Subscriber.count
    @electoral_districts = ElectoralDistrict.scoped
    @houses = House.scoped
    @people = Person.scoped
    @region_committees = RegionCommittee.scoped
    @members = Member.scoped
    @electoral_districts = ElectoralDistrict.scoped
    @uics = Uic.scoped
    #@graph

    render :layout => "front"
  end

end
