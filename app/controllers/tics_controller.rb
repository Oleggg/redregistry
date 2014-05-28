class TicsController < BaseController
  set_main_menu(:cards)
  set_sub_menu(:tics)

  def index
    @page = params[:page] || 1
    tics = Tic.scoped
    @TICs = tics.scoped.paginate(:page => @page)
  end

  def new
      @TIC = Tic.new
      @TIC.addresses.build
      @TIC_address = @TIC.addresses.first
      # по умолчанию ставим точку на площадь Ленина
      @TIC_address.lat = 45.018662
      @TIC_address.lng = 53.195097
      #@TIC.addresses.build
  end

  def edit
      @TIC = Tic.find(params[:id])
      @TIC.addresses.build if @TIC.addresses.empty?
      respond_to do |format|
          format.html
          format.js  #{ render :action => "index" }
      end
  end

  def create
    p = params[:tic]
    @TIC = Tic.new(params[:tic])
    if @TIC.save
      redirect_to(tics_path, :notice => 'ТИК успешно создана.')
    else
      render :action => "new"
    end
  end

  def update
    @TIC = Tic.find(params[:id])
    tic_params = params[:tic]

    if @TIC.update_attributes(tic_params)
      redirect_to(tics_path, :notice => 'ТИК успешно обновлен.')
    else
      render :action => "edit"
    end
  end

  def show
      @TIC = Tic.find(params[:id])
      @TIC_address = @TIC.addresses.first if @TIC.addresses.first
  end

  def destroy
    @TIC = Tic.find(params[:id])
    @TIC.destroy
    redirect_to(tics_path)
  end

end
