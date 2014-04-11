class EventlogsController < BaseController
  set_main_menu :settings
  set_sub_menu :eventlogs

  def index
    @page = params[:page] || 1
    eventlogs = Eventlog.scoped
    eventlogs = Eventlog.where(:event_type => params[:event_type]) if params[:event_type] && !params[:event_type].empty?
    @events = eventlogs.sorted.paginate(:page => @page)
  end
end

