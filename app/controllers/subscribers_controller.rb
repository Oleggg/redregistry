class SubscribersController < ApplicationController
  set_main_menu(:cards)
  set_sub_menu(:subscribers)

  def index
    @page = params[:page] || 1
    subscribers = Subscriber.scoped

    @subscribers = subscribers.scoped.paginate(:page => @page)

  end

  def new
    @subscriber = Subscriber.new
    #@house.addresses.build
    #@house_address = @house.addresses.first
    # по умолчанию ставим точку на площадь Ленина
    #@house_address.lat = 45.018662
    #@house_address.lng = 53.195097
    #@house.build_person
    #@house.person.addresses.build
  end

  def edit
    @subscriber = Subscriber.find(params[:id])
    #@card.person.addresses.build if @card.person.addresses.empty?
    respond_to do |format|  
        format.html
        format.js  #{ render :action => "index" }  
    end

  end

  def create
    p = params[:subscriber]
    @subscriber = Subscriber.new(params[:subscriber])
    @subscriber.total_subscribers = Subscriber.count
    if @subscriber.save
      redirect_to(subscribers_path, :notice => 'Подписчик успешно добавлен.')
    else
      render :action => "new"
    end
  end

  def update
    @subscriber = Subscriber.find(params[:id])
    @subscriber.total_subscribers = Subscriber.count
    subscriber_params = params[:subscriber]

    if @subscriber.update_attributes(subscriber_params)
      redirect_to(subscribers_path, :notice => 'Подписчик успешно обновлен.')
    else
      render :action => "edit"
    end
  end

  def show
    @subscriber = Subscriber.find(params[:id])
  end

  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy
    redirect_to(subscribers_path)
  end


end
