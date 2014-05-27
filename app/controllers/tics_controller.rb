class TicsController < BaseController
  set_main_menu(:cards)
  set_sub_menu(:tics)

  def index
    @page = params[:page] || 1
    TICs = Tic.scoped
    @TICs = TICs.scoped.paginate(:page => @page)
  end

end
