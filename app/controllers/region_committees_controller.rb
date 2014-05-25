class RegionCommitteesController < BaseController
  set_main_menu(:cards)
  set_sub_menu(:region_committees)
  respond_to :html, :xml, :json

  def index
    @page = params[:page] || 1
    rcommittees = RegionCommittee.scoped

    @rcommittees = rcommittees.scoped.paginate(:page => @page)

  end

  def new
    @rcommittee = RegionCommittee.new
    @rcommittee.addresses.build
    @rcommittee_address = @rcommittee.addresses.first
    # по умолчанию ставим точку на площадь Ленина
    @rcommittee_address.lat = 45.018662
    @rcommittee_address.lng = 53.195097
    #@house.build_person
    #@house.person.addresses.build
  end

  def edit
    @rcommittee = RegionCommittee.find(params[:id])
    @rcommittee.addresses.build if @rcommittee.addresses.empty?

    respond_to do |format|  
        format.html
        format.js  #{ render :action => "index" }  
    end

  end

  def create
    p = params[:region_committee]
    @rcommittee = RegionCommittee.new(params[:region_committee])
    if @rcommittee.save
      redirect_to(region_committees_path, :notice => 'Райком успешно создан.')
    else
      render :action => "new"
    end
  end

  def update
    @rcommittee = RegionCommittee.find(params[:id])
    rcommittee_params = params[:region_committee]

    if @rcommittee.update_attributes(rcommittee_params)
      redirect_to(region_committees_path, :notice => 'Райком успешно обновлен.')
    else
      render :action => "edit"
    end
  end

  def show
    @rcommittee = RegionCommittee.find(params[:id])
    @rcommittee_address = @rcommittee.addresses.first if @rcommittee.addresses.first
  end

  def destroy
    @rcommittee = RegionCommittee.find(params[:id])
    @rcommittee.destroy
    redirect_to(region_committees_path)
  end

end
