class ElectoralDistrictsController < BaseController
  set_main_menu(:cards)
  set_sub_menu(:electoral_districts)
  respond_to :html, :xml, :json

  def index
    @page = params[:page] || 1
    electoral_districts = ElectoralDistrict.scoped

    if params[:elections_level] && !params[:elections_level].empty?
      electoral_districts = electoral_districts.where(:level => params[:elections_level])
      @electoral_districts = electoral_districts.scoped.paginate(:page => @page)
    end

    #@electoral_districts = electoral_districts.scoped.paginate(:page => @page)

  end

  def new
    @electoral_district = ElectoralDistrict.new
    @electoral_district.houses.build
    #@electoral_districts.addresses.build
    #@house_address = @house.addresses.first
    # по умолчанию ставим точку на площадь Ленина
    #@house_address.lat = 45.018662
    #@house_address.lng = 53.195097
    #@house.build_person
    #@house.person.addresses.build
  end

  def edit
    @electoral_district = ElectoralDistrict.find(params[:id])
    @electoral_district.houses.build if @electoral_district.houses.empty?
    #@house.addresses.build if @house.addresses.empty?

    respond_to do |format|  
        format.html
        format.js  #{ render :action => "index" }  
    end

  end

  def create
    p = params[:electoral_district]
    @electoral_district = ElectoralDistrict.new(params[:electoral_district])
    if @electoral_district.save
      redirect_to(electoral_districts_path, :notice => 'Округ успешно создан.')
    else
      render :action => "new"
    end
  end

  def update
    @electoral_district = ElectoralDistrict.find(params[:id])
    electoral_district_params = params[:electoral_district]

    if @electoral_district.update_attributes(electoral_district_params)
      redirect_to(electoral_districts_path, :notice => 'Округ успешно обновлен.')
    else
      render :action => "edit"
    end
  end

  def show
    @electoral_district = ElectoralDistrict.find(params[:id])
    @start_point = Address.new
    @start_point.lat = 45.018662
    @start_point.lng = 53.195097
    #@house_address = @house.addresses.first if @house.addresses.first
  end

  def destroy
    @electoral_district = ElectoralDistrict.find(params[:id])
    @electoral_district.destroy
    redirect_to(electoral_districts_path)
  end

  def parse(file)
    list = IO.readlines("#{Rails.root}/public/uploads/#{file}")
    puts list.inspect

    #puts "ED #{file.to_i}"
    #house_name = File.basename("#{Rails.root}/public/uploads/#{file}", ".csv")
    #puts "ED #{ed_name}"
    #new_house = ElectoralDistrict.find_or_create_by_number(house_name.to_i)
    #new_house.description = "#{house_name}"
    #new_house.save!
    #puts new_house.inspect
    list.each_with_index do |s,i|
      s.delete!("\n")
      ed = s.split(";")
      #puts ed.inspect
      #puts "----------# Uploading #{ed} ----------------- ..."
      puts "----------# Uploading #{ed[0]} - #{ed[1]} - #{ed[2]} - #{ed[3]}"
      new_edistrict = ElectoralDistrict.find_or_create_by_number(ed[0].to_i)
      new_edistrict.name = "Избирательный округ № #{ed[0]}" if !new_edistrict.name
      new_edistrict.save!
      puts new_edistrict.inspect

      #person[0].tr("\"", "")
      #lastname = person[2]
      #puts lastname
      #puts "# #{person[2].delete("\"")}"
      ed.map! { |e| e.delete("\"") }
      puts "----------# Uploading #{ed[0]} - #{ed[1]} - #{ed[2]} - #{ed[3]}"

      new_street = Street.find_or_create_by_name(ed[1], :region_id => 58)
      new_street.electoral_district_id = new_edistrict.id
      new_street.save!
      puts '# New street ' + new_street.inspect

      houses = ed.drop(2)
      puts '# Houses ' + houses.inspect
      houses.each_with_index do |h,i|
        new_house = House.find_or_create_by_number(h.to_i)
        new_house.electoral_district_id = new_edistrict.id
        new_house.description = "Дом № #{h}" if new_house.description.to_s.empty?
        new_house.save!
        puts '# New house ' + new_house.inspect
      end

      #new_tenant = Person.create(:first_name => "#{person[0]}", :last_name => "#{person[1]}", :middle_name => "#{person[2]}", :birthday => "#{person[3]}")
      #puts "----------# New tenant - #{new_tenant.id}"

      #new_distr = Person.create(:apartment_num => "#{person[0]}", :first_name => "#{person[2]}", :last_name => "#{person[1]}", :middle_name => "#{person[3]}", :birthday => "#{person[4]}", :birthyear => "#{person[4]}", :house_id => new_house.id)
      #puts "# New tenant - #{new_tenant.inspect}"
    end
  end


  def import
    excel_file = params[:file]
    if params[:file]
      uploaded_io = params[:file]['file']
      puts uploaded_io.inspect
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      parse(uploaded_io.original_filename)
      tfile = Tempfile.new("tmp.csv")
      tfile << excel_file
      tfile.close
      puts tfile.inspect
      puts "# Uploading #{tfile} ..."
      path = params[:file]
      flash[:notice] = "Импорт округов завершен."
    end
  end


end
