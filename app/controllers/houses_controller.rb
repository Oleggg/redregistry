class HousesController < BaseController
  set_main_menu(:cards)
  set_sub_menu(:houses)
  respond_to :html, :xml, :json

  def index
    @page = params[:page] || 1
    #cards = Card.joins(:person)
    houses = House.scoped

    #if params[:name] && !params[:name].empty?
    #  cards = cards.where("people.first_name LIKE :name OR people.last_name LIKE :name OR people.middle_name LIKE :name",
    #    :name => "%#{params[:name].strip}%")
    #end
    #cards = cards.where("is_archived = false OR is_archived IS NULL")
    #cards = cards.where(:is_archived => false or :is_archived.blank?)
#   @cards = cards.sorted.paginate(:page => @page)
    #sort = case params['sort']
    #       when "name"  then "people.last_name"
    #       when "name_reverse"  then "people.first_name"
    #       end
    @houses = houses.scoped.paginate(:page => @page)

  end

  def new
    @house = House.new
    @house.addresses.build
    @house_address = @house.addresses.first
    # по умолчанию ставим точку на площадь Ленина
    @house_address.lat = 45.018662
    @house_address.lng = 53.195097
    #@house.build_person
    #@house.person.addresses.build
  end

  def edit
    @house = House.find(params[:id])
    #@card.person.addresses.build if @card.person.addresses.empty?

    respond_to do |format|  
        format.html
        format.js  #{ render :action => "index" }  
    end

  end

  def create
    p = params[:house]
    @house = House.new(params[:house])
    if @house.save
      redirect_to(cards_path, :notice => 'Дом успешно создан.')
    else
      render :action => "new"
    end
  end

  def update
    @house = House.find(params[:id])
    house_params = params[:house]

    if @house.update_attributes(house_params)
      redirect_to(houses_path, :notice => 'Дом успешно обновлен.')
    else
      render :action => "edit"
    end
  end

  def show
    @card = House.find(params[:id])
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy
    redirect_to(houses_path)
  end

end
