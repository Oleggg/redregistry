#require 'rubygems'
require 'google_chart'
#require 'gchart'

class Reports::ReportsController < BaseController
    COLORS = {1 => '0000ff',2 => 'c53711',3 => '104822',4 => '356199',5 => '444144',6 => '589815',7 => '481819',8 => '221198', 9 => 'c53711' ,10 => 'F95786'}

  set_main_menu :reports

  def index
  end

  def registration_cause
    GoogleChart::PieChart.new('500x200',"\nПричины постановки на учёт",false) do |pc|
      RegistrationCause.all.each_with_index do |reg_cause, i|
        pc.data "#{reg_cause.name} (#{reg_cause.children_count})", reg_cause.children_count, "#{COLORS[i+1]}"
      end
      puts pc.to_url
      pc.show_labels = true
      puts "\nPie Chart (with no labels)"
      @graph = pc.to_url  
    end
    set_sub_menu :registration_cause
  end

  def print_registration_cause
    @total_children = Card.count
    @total_families = Family.count
    render :layout => "print"
  end

  def accommodations
    GoogleChart::PieChart.new('500x200',"\nУсловия проживания",false) do |pc|
      Accommodation.all.each_with_index do |accomodation, i|
        pc.data "#{accomodation.name} (#{accomodation.children_count})", accomodation.children_count, "#{COLORS[i+1]}"
      end
      puts pc.to_url
      pc.show_labels = true
      @graph = pc.to_url  
    end
    set_sub_menu :accommodations
  end

  def print_accommodations
    @total_children = Card.count
    @total_families = Family.count
    render :layout => "print"
  end

  def health_status
    @total_children = Card.count
    @total_families = Family.count
    @total_children_healthy = Card.children_healthy_count
    @total_children_disabled = Card.children_disabled_count
    @total_families_healthy = Family.cards_healthy_count
    @total_families_disabled = Family.cards_disabled_count

    bar_1_data = [350,110,700]
    bar_2_data = [200,800,50]
    color_1 = 'c53711'
    color_2 = '0000ff'
    colors = {1 => '0000ff',2 => 'c53711',3 => '104822',4 => '356199',5 => '444144',6 => '589815',7 => '481819',8 => '221198', 9 => 'c53711' ,10 => 'F95786'}
    names_array = ["Bob","Stella","Foo"]
      a = []
      #Doctor.all.each_with_index do |doctor, i|
      #  a << doctor.total_children_count
      #end
      GoogleChart::PieChart.new('320x200',"\nЗдоровье: на учете у специалистов",false) do |pc|
        Doctor.all.each_with_index do |doctor, i|
          pc.data "#{doctor.name} (#{doctor.total_children_count})", doctor.total_children_count, "#{colors[i+1]}"
        end
        puts "\nPie Chart"
        puts pc.to_url
 
       # Pie Chart with no labels
       pc.show_labels = true
       puts "\nPie Chart (with no labels)"
       @graph = pc.to_url  
    end

    GoogleChart::BarChart.new("500x#{Doctor.count*30}", "\nЗдоровье", :horizontal, false) do |bc| 
      #bc.data "FirstResultBar", bar_1_data, "#{colors[rand(10)]}"
      #rand(10)
      #bc.data "SecondResultBar", bar_2_data, "#{colors[rand(10)]}"
      #bc.data "#doctor.name", a, "#{colors[rand(10)]}"
      Doctor.all.each_with_index do |doctor, i|
        a = []
        a << doctor.total_children_count
        rand(10)
        #bc.data "#{doctor.name}", a, "#{colors[rand(1000/100)]}"
        bc.data "#{doctor.name}", a, "#{COLORS[i+1]}"
      end
#      bc.data "Trend 1", [5,4,3,1,3,5], '0000ff'
#      bc.data "Trend 2", [1,2,3,4,5,6], 'ff0000'
#      bc.data "Trend 3", [6,5,4,4,5,6], '00ff00'

#      Doctor.all.each_with_index do |doctor, i|
        #= i+1
        #= doctor.total_children_count
        #= doctor.total_families_count
#        bc.data "#{doctor.name}", a, "#{colors[rand(10)]}"
#      end
      #bc.data "FirstResultBar", @total_children_healthy, "#{colors[rand(8)]}"
      #bc.data "SecondResultBar", @total_children_disabled, "#{colors[rand(8)]}"
      #bc.data "SecondResultBar", bar_2_data, "#{0xffff*rand(100)}"
   #  bc.axis :y, :labels = names_array, :font_size = 10
   #  bc.axis :x, :range = [0,1000]
#      bc.show_legend = false
#      bc.stacked = true
#      bc.data_encoding = :extended
   #  bc.shape_marker = :circle, :color = '00ff00', :data_set_index = 0, :data_point_index = -1, :pixel_size = 10
#      puts bc.to_url

      #bc.data "Trend 1", [5], '0000ff'
      #bc.data "Trend 2", [1], 'ff0000'
      #bc.data "Trend 3", [6], '00ff00'
      #bc.data "Trend 1", [5,4,3,1,3,5], '0000ff'
      #bc.data "Trend 2", [1,2,3,4,5,6], 'ff0000'
      #bc.data "Trend 3", [6,5,4,4,5,6], '00ff00'
      puts "\nBar Chart"
      puts "\nЗдоровье"
      @graphb = bc.to_url
    end
    set_sub_menu :health_status
  end

  def print_health_status
    @total_children = Card.count
    @total_families = Family.count
    @total_children_healthy = Card.children_healthy_count
    @total_children_disabled = Card.children_disabled_count
    @total_families_healthy = Family.cards_healthy_count
    @total_families_disabled = Family.cards_disabled_count
    render :layout => "print"
  end

  def cards_list
    set_sub_menu :cards_list
  end

  def print_cards_list
    cards = Card.joins(:person)
    if params[:is_archived]
      @cards = cards.where("is_archived = true").sorted.paginate(:page => @page)  
    else
      @cards = cards.where("is_archived = false OR is_archived IS NULL").sorted.paginate(:page => @page)
    end
    render :layout => "print"
  end

  def print_payroll
    set_sub_menu :payroll
  end

  def print_payroll
    cards = Card.joins(:person)
    if params[:is_archived]
      @cards = cards.where("is_archived = true").sorted.paginate(:page => @page)  
    else
      @cards = cards.where("is_archived = false OR is_archived IS NULL").sorted.paginate(:page => @page)
    end
    render :layout => "print"
  end

  def cards_families_structure
    set_sub_menu :families_structure
  end

  def print_families_structure
    render :layout => "print"
  end

  def card
    set_sub_menu :card
    @page = params[:page] || 1
    cards = Card.joins(:person)
    @cards = cards.sorted.paginate(:page => @page)
  end

  def print_card
    if params[:card]
      #@card = []
      #Card.find(params[:card][:selected]).each do |card|
      #  @card << card
      #end
      #@card = Card.find(params[:card][:selected][0])
      @card = Card.find(params[:card])
      render :layout => "print"
    else
      flash[:notice] = "Выберите карточку!"
      redirect_to :action => :card
    end
  end

  def cards_fill_control
    set_sub_menu :cards_fill_control
  end

  def print_cards_fill_control
    render :layout => "print"
  end

  def form_11AIS
    set_sub_menu :form_11AIS
  end

  def print_form_11AIS
    cards = Card.joins(:person)
    date_from = params[:date_from]
    date_to = params[:date_to]
    @d_from = "#{params[:date_from]["(1i)"]}-#{params[:date_from]["(2i)"]}-#{params[:date_from]["(3i)"]}"
    @d_to = "#{params[:date_to]["(1i)"]}-#{params[:date_to]["(2i)"]}-#{params[:date_to]["(3i)"]}"
    @d_from_f = "#{params[:date_from]["(3i)"]}/#{params[:date_from]["(2i)"]}/#{params[:date_from]["(1i)"]} г."
    @d_to_f = "#{params[:date_to]["(3i)"]}/#{params[:date_to]["(2i)"]}/#{params[:date_to]["(1i)"]} г."
    #str_date_from = Date.strptime(params[:date_from], '%d.%m.%Y')
    #str_date_to = Date.strptime(params[:date_to], '%d.%m.%Y')
    if params[:date_from] && !params[:date_from].empty? and if params[:date_to] && !params[:date_to].empty?
      #@total_children_period = Card.where("registered_at >=\"?\" AND registered_at <=\"?\"", params[:date_from],params[:date_to]).count
      #@total_children_period = Card.where("registered_at >= \"2009-01-01\" AND registered_at <=\"2010-08-01\"").count
      @total_children_period = Card.where("registered_at >=\"#{params[:date_from].to_s}\" AND registered_at <=\"#{params[:date_to].to_s}\"").count
      @total_children_period = Card.where("registered_at >=\"#{date_from["(1i)"]}-#{date_from["(2i)"]}-#{date_from["(3i)"]}\" AND registered_at <=\"#{date_to["(1i)"]}-#{date_to["(2i)"]}-#{date_to["(3i)"]}\"").count
      @total_children_period = Card.where("registered_at >=\"#{@d_from}\" AND registered_at <=\"#{@d_to}\"").count
#      @total_children = Card.where("registered_at >=?", params[:date_from]).all
    end
#    end
    else
      @total_children = Card.count
    end
    @total_help = ChildHelp.total_children_count
    @total_help_period = ChildHelp.total_children_count_period(@d_from,@d_to)
#    @children_category_count_period = Category.child_count_period(@d_from,@d_to)
    render :layout => "print"
  end

  def form_11AIS_families
    set_sub_menu :form_11AIS
  end

  def print_form_11AIS_families
    @d_from = "#{params[:date_from]["(1i)"]}-#{params[:date_from]["(2i)"]}-#{params[:date_from]["(3i)"]}"
    @d_to = "#{params[:date_to]["(1i)"]}-#{params[:date_to]["(2i)"]}-#{params[:date_to]["(3i)"]}"
    @d_from_f = "#{params[:date_from]["(3i)"]}/#{params[:date_from]["(2i)"]}/#{params[:date_from]["(1i)"]} г."
    @d_to_f = "#{params[:date_to]["(3i)"]}/#{params[:date_to]["(2i)"]}/#{params[:date_to]["(1i)"]} г."
#   @total_families_period = Card.where("registered_at >=\"#{d_from}\" AND registered_at <=\"#{d_to}\"").count
    @total_families = Family.count
    @total_families_period = Family.family_count_period(@d_from,@d_to)
    @total_families_children_period = Family.children_count_period(@d_from,@d_to)
    @total_families_children = Family.children_count
    render :layout => "print"
  end

  def cc_article
    colors = {1 => '0000ff',2 => 'c53711',3 => '104822',4 => '356199',5 => '444144',6 => '589815',7 => '481819',8 => '221198', 9 => 'c53711' ,10 => 'F95786'}
    GoogleChart::PieChart.new('400x200',"\nСтатьи УК",false) do |pc|
      CcArticle.all.each_with_index do |cc_article, i|
        pc.data "#{cc_article.name} (#{cc_article.cards_count})", cc_article.cards_count, "#{COLORS[i+1]}"
      end
      puts pc.to_url
      pc.show_labels = true
      puts "\nPie Chart (with no labels)"
      @graph = pc.to_url  
    end
    set_sub_menu :cc_article
  end

  def print_cc_article
    @total_children = Card.count
    render :layout => "print"
  end

  def employment_types
    set_sub_menu :employment_type
  end

  def print_employment_types
    @total_children = Card.count
    @total_families = Family.count
    #@d_from = "#{params[:date_from]["(1i)"]}-#{params[:date_from]["(2i)"]}-#{params[:date_from]["(3i)"]}"
    #@d_to = "#{params[:date_to]["(1i)"]}-#{params[:date_to]["(2i)"]}-#{params[:date_to]["(3i)"]}"
    #@d_from_f = "#{params[:date_from]["(3i)"]}/#{params[:date_from]["(2i)"]}/#{params[:date_from]["(1i)"]} г."
    #@d_to_f = "#{params[:date_to]["(3i)"]}/#{params[:date_to]["(2i)"]}/#{params[:date_to]["(1i)"]} г."
#   @total_families_period = Card.where("registered_at >=\"#{d_from}\" AND registered_at <=\"#{d_to}\"").count
    #@total_families_period = Family.family_count_period(@d_from,@d_to)
    render :layout => "print"
  end

  def subscribers
    if params[:house_id]
      puts '### POST ' + params[:house_id]
      @house = House.find(params[:house_id])
      GoogleChart::PieChart.new('500x200',"\nПодписчики",false) do |pc|
        #pc.data "Жильцы (#{@house.tenants_count})", @house.tenants_count, "#{COLORS[1]}"
        pc.data "Не подписаны (#{@house.tenants_count - @house.subscribers_count})", (@house.tenants_count - @house.subscribers_count), "#{COLORS[1]}"
        pc.data "Подписчики (#{@house.subscribers_count})", @house.subscribers_count, "#{COLORS[2]}"
        puts pc.to_url
        pc.show_labels = true
        puts "\nPie Chart (with no labels)"
        @graph = pc.to_url  
      end
    else
      #@cards = cards.where("is_archived = false OR is_archived IS NULL").sorted.paginate(:page => @page)
    end
    set_sub_menu :subscribers
  end

  def print_subscribers
    #@total_tenants = Card.count
    #@total_subscribers = Family.count
    if params[:house_id]
      puts '### POST ' + params[:house_id]
      @house = House.find(params[:house_id])
      @total_tenants = @house.tenants_count
      @total_subscribers = @house.subscribers_count
    end
    render :layout => "print"
  end

  def subscribers_total
    subsribers_data = []
    subscribers = Subscriber.all
    subsribers_data = subscribers.collect {|s| [ s.total_subscribers ] }
    puts subsribers_data
    subsribers_data.each &:compact!
    puts subsribers_data
    lc = GoogleChart::LineChart.new('500x200',"\nПодписчики",false) do |lc|
    #lc.data "Line green", [3,5,1,9,0,2], '00ff00'
    #lc.data "Line red", [2,4,0,6,9,3], 'ff0000'
    lc.data "Обшее число подписчиков", subsribers_data, 'ff0000'
    lc.axis :y, :range => [0,10], :font_size => 10, :alignment => :center
    lc.show_legend = true
    lc.shape_marker :circle, :color => '0000ff', :data_set_index => 0, :data_point_index => -1, :pixel_size => 10
    end
    @graph = lc.to_url


    #GoogleChart::PieChart.new('500x200',"\nПодписчики",false) do |pc|
      #pc.data "Жильцы (#{@house.tenants_count})", @house.tenants_count, "#{COLORS[1]}"
    #  pc.data "Не подписаны (#{@house.tenants_count - @house.subscribers_count})", (@house.tenants_count - @house.subscribers_count), "#{COLORS[1]}"
    #  pc.data "Подписчики (#{@house.subscribers_count})", @house.subscribers_count, "#{COLORS[2]}"
    #  puts pc.to_url
    #  pc.show_labels = true
    #  puts "\nPie Chart (with no labels)"
    #  @graph = pc.to_url  
    #end
    #set_sub_menu :subscribers
  end

  def print_subscribers_total
    #@total_tenants = Card.count
    #@total_subscribers = Family.count
    if params[:house_id]
      puts '### POST ' + params[:house_id]
      @house = House.find(params[:house_id])
      @total_tenants = @house.tenants_count
      @total_subscribers = @house.subscribers_count
    end
    render :layout => "print"
  end

end

