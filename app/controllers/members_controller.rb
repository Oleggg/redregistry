class MembersController < BaseController
  set_main_menu(:cards)
  set_sub_menu(:members)
  respond_to :html, :xml, :json

  def index
    @page = params[:page] || 1
    members = Member.scoped
    @members = members.scoped.paginate(:page => @page)

  end

  def new
    @member = Member.new
    @member.addresses.build
    @member_address = @member.addresses.first
    # по умолчанию ставим точку на площадь Ленина
    @member_address.lat = 45.018662
    @member_address.lng = 53.195097
    #@house.build_person
    #@house.person.addresses.build
  end

  def edit
    @member = Member.find(params[:id])
    @member.addresses.build if @member.addresses.empty?

    respond_to do |format|  
        format.html
        format.js  #{ render :action => "index" }  
    end

  end

  def create
    p = params[:member]
    @member = Member.new(params[:member])
    if @member.save
      redirect_to(members_path, :notice => 'Член КПРФ успешно создан.')
    else
      render :action => "new"
    end
  end

  def update
    @member = Member.find(params[:id])
    member_params = params[:member]

    if @member.update_attributes(member_params)
      redirect_to(members_path, :notice => 'Член КПРФ успешно обновлен.')
    else
      render :action => "edit"
    end
  end

  def show
    @member = Member.find(params[:id])
    @member_address = @member.addresses.first if @member.addresses.first
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to(members_path)
  end

end
