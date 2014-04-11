class CardsController < BaseController
  set_main_menu(:cards)
  set_sub_menu(:cards)
#  respond_to :js
  respond_to :html, :xml, :json


  def index
    @page = params[:page] || 1
    cards = Card.joins(:person)

    if params[:name] && !params[:name].empty?
      cards = cards.where("people.first_name LIKE :name OR people.last_name LIKE :name OR people.middle_name LIKE :name",
        :name => "%#{params[:name].strip}%")
    end
    cards = cards.where("people.gender" => params[:gender]) if params[:gender] && !params[:gender].empty?
    if params[:age_from] && !params[:age_from].empty?
      cards = cards.where("YEAR(CURDATE())-YEAR(people.birthday)>=?", params[:age_from])
    end
    if params[:age_to] && !params[:age_to].empty?
      cards = cards.where("YEAR(CURDATE())-YEAR(people.birthday)<=?", params[:age_to])
    end
    if params[:registration_reason] && !params[:registration_reason].empty?
      cards = cards.where(:registration_reason_id => params[:registration_reason])
    end
    


    if params[:date_from] && !params[:date_from].empty? && params[:date_to] && !params[:date_to].empty?
      @d_from = "#{params[:date_from]["(1i)"]}-#{params[:date_from]["(2i)"]}-#{params[:date_from]["(3i)"]}"
      @d_to = "#{params[:date_to]["(1i)"]}-#{params[:date_to]["(2i)"]}-#{params[:date_to]["(3i)"]}"
      cards = cards.where("registered_at between ? and ?",@d_from,@d_to)
      @d_from_c = params[:date_from]
      @d_to_c = params[:date_to]
    end
    cards = cards.where("is_archived = false OR is_archived IS NULL")
    #cards = cards.where(:is_archived => false or :is_archived.blank?)
#   @cards = cards.sorted.paginate(:page => @page)
    sort = case params['sort']
           when "name"  then "people.last_name"
           when "name_reverse"  then "people.first_name"
           when "reg_num"   then "reg_num"
           when "reg_num_reverse"   then "reg_num DESC"
           when "age"   then "age"
           when "gender" then "gender"
#          when "name_reverse"  then "name DESC"
           when "age_reverse"   then "age DESC"
           when "gender_reverse" then "gender DESC"
           end
    @cards = cards.paginate(:page => @page, :order => sort)
    #@new_cards = cards.paginate(:page => @page, :order => sort)
    #respond_with(@new_cards = Card.all.collect {|cd| [ "#{cd.reg_num}","#{cd.reg_num}"] } )
    #respond_with(@new_cards = Card.all.collect {|cd| [ cd.person.last_name,cd.person.last_name] } )
    #@new_cards = Card.all.collect {|cd| [ :id=> cd.person.id, :value => cd.person.id] }
    #@new_cards.to_json
    #@reg_causes = @cards.registration_causes.all
    #format.json { render :json => cards.to_json }
    #respond_with(@cards)
    #format.js { render :json => @items.to_json(:only => [:id, :content]) }
    if params[:term]
      people = Person.find(:all,:conditions => ['last_name LIKE ?', "#{params[:term]}%"],  :limit => 5)
    else
      people = Person.all
    end
    #ActiveRecord::Base.include_root_in_json = false
    #respond_with(@persons.to_json(:only => [:last_name]) )


#   respond_to do |wants|
 #    wants.html
 #    wants.js
#   end
    @peoplej = people.map(&:last_name).to_json
    #ActiveRecord::Base.include_root_in_json = false
    respond_to do |format|  
        format.html
        format.js  #{ render :action => "index" }  
        #format.json  { render :json => @cards ,:only => :person.last_name }
        #format.json  { render :json => @people[1].last_name }
        #format.json  { render :json => @people, :only => [:id, :last_name ] }
        #format.json  { render :json => @people, :only => :last_name }
        #format.json  { render :json => @people.collect {|person| [ person.last_name] } }
        format.json  { render :json => @peoplej }
    end

  end

  def new
    @card = Card.new
    @card.build_person
    @card.person.addresses.build
  end

  def edit
    @card = Card.find(params[:id])
    @card.person.addresses.build if @card.person.addresses.empty?
#    @reg_causes = @card.registration_causes.all
    @reg_causes = Card.joins(:registration_cause)

    respond_to do |format|  
        format.html
        format.js  #{ render :action => "index" }  
    end

  end

  def create
    p = params[:card]
    @card = Card.new(params[:card])
    if @card.save
      redirect_to(cards_path, :notice => 'Карточка успешно создана.')
    else
      render :action => "new"
    end
  end

  def update
    @card = Card.find(params[:id])
    card_params = params[:card]

    # установить автоматически пол по родству
    card_params["relatives_attributes"].each_value do |v|
      relationship = Relationship.find(v[:relationship_id])
      v[:person_attributes][:gender] = relationship.gender.to_s if v[:person_attributes]
    end if card_params["relatives_attributes"]

    if @card.update_attributes(card_params)
      redirect_to(cards_path, :notice => 'Карточка успешно обновлена.')
    else
      render :action => "edit"
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to(cards_path)
  end

  def archive
    @page = params[:page] || 1
    cards = Card.joins(:person)

    if params[:name] && !params[:name].empty?
      cards = cards.where("people.first_name LIKE :name OR people.last_name LIKE :name OR people.middle_name LIKE :name",
        :name => "%#{params[:name].strip}%")
    end
    cards = cards.where("people.gender" => params[:gender]) if params[:gender] && !params[:gender].empty?
    if params[:age_from] && !params[:age_from].empty?
      cards = cards.where("YEAR(CURDATE())-YEAR(people.birthday)>=?", params[:age_from])
    end
    if params[:age_to] && !params[:age_to].empty?
      cards = cards.where("YEAR(CURDATE())-YEAR(people.birthday)<=?", params[:age_to])
    end
    if params[:registration_reason] && !params[:registration_reason].empty?
      cards = cards.where(:registration_reason_id => params[:registration_reason])
    end

    cards = cards.where(:is_archived => true)
    @cards = cards.paginate(:page => @page)
    render :template => "cards/index"
  end

  def city_by_district
    district = District.find(params[:id])
    #@cities = City.where(:district_id => district.code ).all
    @result = []
    cities = City.for_select(district.code)
    towns = Town.for_select(district.code)
    @result << cities << towns
    #ActiveSupport::JSON.encode(cities,:only => :name)
    #return cities
    respond_to do |format|  
        format.html
        format.js  #{ render :action => "index" }  
        #format.json  { render :json => @cities ,:name => :name, :id => :id }
        format.json { render :json => @result ,:name => :name, :id => :id }
    end
  end

  def town_by_district
    district = District.find(params[:id])
    #@cities = City.where(:district_id => district.code ).all
    @cities = Town.for_select(district.code)
    #ActiveSupport::JSON.encode(cities,:only => :name)
    #return cities
    respond_to do |format|  
        format.html
        format.js
        format.json  { render :json => @cities ,:name => :name, :id => :id }
    end
  end

  def streets_by_city
    city = City.find(params[:id])
    @streets = Street.for_select(city.code)
    respond_to do |format|  
        format.html
        format.js
        format.json  { render :json => @streets ,:name => :name, :id => :id }
    end
  end

  def streets_by_town
    town = Town.find(params[:id])
    @streets = Street.for_select_town(town.code)
    respond_to do |format|  
        format.html
        format.js
        format.json  { render :json => @streets ,:name => :name, :id => :id }
    end
  end

  def find_city
    @cities = City.for_select(params[:district_id])
    #render :partial => "city"
  end

end

