class UicsController < BaseController
  set_main_menu(:cards)
  set_sub_menu(:uics)

  def index
    @page = params[:page] || 1
    uics = Uic.scoped
    @UICs = uics.scoped.paginate(:page => @page)
  end

  def new
      @UIC = Uic.new
      @UIC.addresses.build
      @UIC_address = @UIC.addresses.first
      # по умолчанию ставим точку на площадь Ленина
      @UIC_address.lat = 45.018662
      @UIC_address.lng = 53.195097
      @UIC.addresses.build
  end

  def edit
      @UIC = Uic.find(params[:id])
      @UIC.addresses.build if @UIC.addresses.empty?
      respond_to do |format|
          format.html
          format.js  #{ render :action => "index" }..
      end
  end

  def create
    p = params[:uic]
    @UIC = Uic.new(params[:uic])
    if @UIC.save
      redirect_to(uics_path, :notice => 'УИК успешно создана.')
    else
      render :action => "new"
    end
  end

  def update
    @UIC = Uic.find(params[:id])
    uic_params = params[:uic]

    if @UIC.update_attributes(uic_params)
      redirect_to(uics_path, :notice => 'УИК успешно обновлен.')
    else
      render :action => "edit"
    end
  end

  def show
      @UIC = Uic.find(params[:id])
      @UIC_address = @UIC.addresses.first if @UIC.addresses.first
  end

  def destroy
    @UIC = Uic.find(params[:id])
    @UIC.destroy
    redirect_to(uics_path)
  end

end
