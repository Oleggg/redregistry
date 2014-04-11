class CompaniesController < BaseController
  set_main_menu :cards
  set_sub_menu :companies

  def index
    @page = params[:page] || 1
    companies = Company.scoped
    companies = Company.where("name LIKE ?", "%#{params[:name]}%") if params[:name] && !params[:name].empty?
    companies = Company.where(:company_type_id => params[:company_type_id]) if params[:company_type_id] && !params[:company_type_id].empty?
    @companies = companies.sorted.paginate(:page => @page)
  end

  def new
    @company = Company.new
    @company.addresses.build
    @company_address = @company.addresses.first

    # по умолчанию ставим точку на площадь Ленина
    @company_address.lat = 45.018662
    @company_address.lng = 53.195097
  end

  def edit
    @company = Company.find(params[:id])
    @company.addresses.build if @company.addresses.empty?
    @company_address = @company.addresses.first
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to(companies_path, :notice => 'Организация успешно создана.')
    else
      render :action => "new"
    end
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      redirect_to(companies_path, :notice => 'Организация успешно обновлена.')
    else
      render :action => "edit"
    end
  end

  def show
    @company = Company.find(params[:id])
    @company_address = @company.addresses.first if @company.addresses.first
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to(companies_path)
  end
end

