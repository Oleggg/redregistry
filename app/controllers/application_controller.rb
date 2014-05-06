require 'lib/menu.rb'

class ApplicationController < ActionController::Base
  # include Authentication

  helper :all
  layout "default"
  protect_from_forgery

  before_filter :init_app_menu

  helper_method :current_user, :logged_in?, :redirect_back_or_default, :current_user?

  private

  def current_user?(user)
    current_user.id == user.id
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = 'Для доступа к этой странице нужно авторизоваться'
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:error] = 'Для доступа к этой странице нужно сначала выйти'
      redirect_to account_path
      return false
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def logged_in?
    current_user
  end

  protected

    def init_app_menu
      main_menu = [
        #{:title => 'Картотека', :url => cards_path},
        {:title => 'Картотека', :url => people_path},
        {:title => 'Отчёты', :url => reports_path},
        #{:title => 'Справочники', :url => vocabularies_path},
        {:title => 'Справочники', :url => vocabularies_cities_path},
        {:title => 'Настройки', :url => settings_path}
      ]

      sub_menu = Rails.cache.fetch("sub_menu", :expire_in => 5.seconds) do
        sub_menu_cards = [
          {:title => 'Поиск', :items => [
            #{:title => "Карточки (#{Card.not_archived_count})", :url => cards_path},
            {:title => "Жильцы (#{Person.count})", :url => people_path},
            {:title => "Подписчики (#{Subscriber.count})", :url => subscribers_path},
            #{:title => "Семьи (#{Family.count})", :url => families_path},
            #{:title => "Организации (#{Company.count})", :url => companies_path},
            {:title => "Дома (#{House.count})", :url => houses_path},
            {:title => "Райкомы КПРФ (#{RegionCommittee.count})", :url => region_committees_path},
            {:title => "Члены КПРФ (#{Member.count})", :url => members_path},
            #{:title => "Архив (#{Card.archived_count})", :url => archive_path },
            {:title => "УИКи ()", :url => '#'},
            {:title => "ТИКи ()", :url => '#'},
          ]},
        ]

        sub_menu_reports = [
          {:title => 'Подписчики', :items => [
            {:title => "Подписчики", :url => subscribers_total_reports_report_path},
            {:title => "Подписчики по домам", :url => subscribers_reports_report_path},
          ]},
          #{:title => 'Карточки', :items => [
          #  {:title => "Регистрационная карточка", :url => card_reports_report_path},
          #  {:title => "Карточки списком", :url => cards_list_reports_report_path},
          #  {:title => "Списочный состав картотеки", :url => payroll_reports_report_path},
          #  {:title => "Контроль заполнения картотеки", :url => cards_fill_control_reports_report_path},
          #]},
          #{:title => 'Формы', :items => [
          #  {:title => "Списки помощи семье и ребёнку", :url => reports_path},
          #  {:title => "Списочный состав семей", :url => families_structure_reports_report_path},
          #  {:title => "-", :url => "#"},
          #  {:title => "Форма 1.1 АИС Информация о детях", :url => form_11AIS_reports_report_path},
          #  {:title => "Форма 1.1 АИС Информация о семьях", :url => form_11AIS_families_reports_report_path},
          #]},
          #  {:title => 'Статистика', :items => [
          #  {:title => "Здоровье", :url => health_status_reports_report_path},
          #  {:title => "Причины постановки на учёт", :url => registration_cause_reports_report_path},
          #  {:title => "Статьи УК", :url => cc_article_reports_report_path},
          #  {:title => "Занятость", :url => employment_types_reports_report_path},
          #  {:title => "Условия проживания", :url => accommodations_reports_report_path},
          #]},
        ]

        sub_menu_vocabularies = [
          {:title => 'Справочники', :items => [
            #{:title => "Профессии (#{Profession.count})", :url => vocabularies_professions_path},
            #{:title => "Типы организации (#{CompanyType.count})", :url => vocabularies_company_types_path},
            #{:title => "Категории учета (#{Category.count})", :url => vocabularies_categories_path},
            #{:title => "Основания для регистрации (#{RegistrationReason.count})", :url => vocabularies_registration_reasons_path},
            #{:title => "Врачи-специалисты (#{Doctor.count})", :url => vocabularies_doctors_path},
            #{:title => "Местонахождения (#{Location.count})", :url => vocabularies_locations_path},
            #{:title => "Учреждения (#{Department.count})", :url => vocabularies_departments_path},
            #{:title => "Виды родства (#{Relationship.count})", :url => vocabularies_relationships_path},
            #{:title => "Состав семьи (#{FamilyStructure.count})", :url => vocabularies_family_structures_path},
            #{:title => "Виды документа (#{DocumentType.count})", :url => vocabularies_document_types_path},
            #{:title => "Виды занятости (#{EmploymentType.count})", :url => vocabularies_employment_types_path},
            #{:title => "Виды документа личного дела (#{PrivacyDocumentType.count})", :url => vocabularies_privacy_document_types_path},
            #{:title => "Статьи УК РФ (#{CcArticle.count})", :url => vocabularies_cc_articles_path},
            #{:title => "Категории семей (#{FamilyType.count})", :url => vocabularies_family_types_path},
            #{:title => "Виды помощи ребёнку (#{ChildHelp.count})", :url => vocabularies_child_helps_path},
            #{:title => "Виды помощи семье (#{FamilyHelp.count})", :url => vocabularies_family_helps_path},
            #{:title => "Виды работ с семьёй (#{FamilyWork.count})", :url => vocabularies_family_works_path},
            #{:title => "Условия проживания (#{Accommodation.count})", :url => vocabularies_accommodations_path},
            #{:title => "Виды здоровья (#{HealthStatus.count})", :url => vocabularies_health_statuses_path},
            #{:title => "Причина постановки на учёт (#{RegistrationCause.count})", :url => vocabularies_registration_causes_path},
            #{:title => "Причина снятия с учёта (#{UnregistrationCause.count})", :url => vocabularies_unregistration_causes_path},
            #{:title => "Характеристики ребёнка (#{ChildCharacter.count})", :url => vocabularies_child_characters_path},
            #{:title => "Характеристики ребёнка", :url => "#"},
          ]}, {:title => 'Адреса', :items => [
            {:title => "Регионы (#{Region.count})", :url => vocabularies_regions_path},
            {:title => "Районы (#{District.count})", :url => vocabularies_districts_path},
            {:title => "Города (#{City.count})", :url => vocabularies_cities_path},
            {:title => "Населенные пункты (#{Town.count})", :url => vocabularies_towns_path},
            {:title => "Улицы (#{Street.count})", :url => vocabularies_streets_path},
          ]},
          {:title => 'Импорт', :items => [
            {:title => "Импорт жителей", :url => people_import_path},
          ]},
        ]

        sub_menu_settings = [
          {:title => 'Пользователи', :items => [
            {:title => "Пользователи (#{User.count})", :url => users_path},
            {:title => "Роли (#{Role.count})", :url => roles_path},
          ]}, {:title => 'Журнал событий', :items => [
            {:title => "Просмотр (#{Eventlog.count})", :url => eventlogs_path},
          ]}
        ]

        { :cards => sub_menu_cards,
          :reports => sub_menu_reports,
          :vocabularies => sub_menu_vocabularies,
          :settings => sub_menu_settings }
      end

      init_main_menu(main_menu)
      init_sub_menu(sub_menu)
    end
end

