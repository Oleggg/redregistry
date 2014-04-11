class PeopleController < BaseController
  set_main_menu :cards
  set_sub_menu :people

  def index
    @page = params[:page] || 1
    #people = Person.scoped
    people = Person.all

    if params[:name] && !params[:name].empty?
      people = people.where("first_name LIKE :name OR last_name LIKE :name OR middle_name LIKE :name",
        :name => "%#{params[:name]}%")
    end
    people = people.where(:gender => params[:gender]) if params[:gender] && !params[:gender].empty?

    if params[:age_from] && !params[:age_from].empty?
      people = people.where("YEAR(CURDATE())-YEAR(birthday)>=?", params[:age_from])
    end
    if params[:age_to] && !params[:age_to].empty?
      people = people.where("YEAR(CURDATE())-YEAR(birthday)<=?", params[:age_to])
    end

    sort = case params['sort']
           when "full_name"  then "people.last_name"
           when "full_name_reverse"  then "people.last_name DESC"
           when "name"  then "people.last_name"
           when "name_reverse"  then "people.first_name"
           when "reg_num"   then "reg_num"
           when "reg_num_reverse"   then "reg_num DESC"
           when "age"   then "age"
           when "gender" then "gender"
           when "gender_reverse" then "gender DESC"
#          when "name_reverse"  then "name DESC"
           when "age_reverse"   then "age DESC"
           when "gender_reverse" then "gender DESC"
           end
    #@cards = cards.paginate(:page => @page, :order => sort)
    #@people = people.sorted.paginate(:page => @page)

    #@people = people.paginate(:page => @page,:order => sort)
    if params[:term]
      people = Person.find(:all,:conditions => ['last_name LIKE ?', "#{params[:term]}%"],  :limit => 5)
    else
      people = Person.all
    end
    @people = people.paginate(:page => @page,:order => sort)
    @peoplej = @people.map(&:last_name).to_json
    respond_to do |format|  
        format.html
        format.json  { render :json => @peoplej }
    end

  end

  def new
    @person = Person.new
    @person.addresses.build
    @person_address = @person.addresses.first

    # по умолчанию ставим точку на площадь Ленина
    @person_address.lat = 45.018662
    @person_address.lng = 53.195097
  end

  def edit
    @person = Person.find(params[:id])
    @person.addresses.build if @person.addresses.empty?
    @person_address = @person.addresses.first
  end

  def create
    @person = Person.new(params[:person])
    respond_to do |format|  
      if @person.save
        #redirect_to(people_path, :notice => 'Персона успешно создана.')
        format.html { redirect_to(people_path, :notice => 'Персона успешно создана.') }  
        format.js  { render :action => "new" }  
      else
        #render :action => "new"
        format.html { render :action => "new" }  
        format.js  
      end
    end
#     respond_to do |format|  
#       if @post.save  
#         format.html { redirect_to(@post, :notice => 'Post created.') }  
#         format.js  
#       else  
#         format.html { render :action => "new" }  
#         format.js  
#       end  
#     end  
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(params[:person])
      redirect_to(people_path, :notice => 'Персона успешно обновлена.')
    else
      render :action => "edit"
    end
  end

  def show
    @person = Person.find(params[:id])
    @person.addresses.build if @person.addresses.empty?
    @person_address = @person.addresses.first if @person.addresses.first
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to(people_path)
  end
end

