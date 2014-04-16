Bigbrother::Application.routes.draw do |map|
  resources :cards
  resources :companies
  resources :people
  resources :families
  resources :houses
  resources :subscribers
  match 'cards' => "cards#index", :as => :cards
  match 'archive' => "cards#archive", :as => :archive
  #match 'city_by_district' => "cards#city_by_district", :as => :city_by_district
  match 'cards/city_by_district/:id' => "cards#city_by_district", :as => :city_by_district
  match 'cards/streets_by_city/:id' => "cards#streets_by_city", :as => :streets_by_city
  match 'cards/streets_by_town/:id' => "cards#streets_by_town", :as => :streets_by_town
  match 'city_by_district' => "cards#city_by_district", :as => :city_by_district
  match 'streets_by_city' => "cards#streets_by_city", :as => :streets_by_city
  match 'streets_by_town' => "cards#streets_by_town", :as => :streets_by_town
  match 'tenants/import' => "people#import", :as => :people_import
#  map.name_of_route 'cards/archive', :controller => 'cards', :action => 'archive'
#  map.with_options :controller => 'cards' do |cards|
 #    cards '', :action  => 'index'
 #   cards.delete 'delete/:id', :action  => 'delete',
 #  cards.edit 'edit/:id', :action  => 'edit',
 #   cards.archive 'archive', :action  => 'archive'
 # end
 #map.connect 'cards/:archive', :controller => 'cards', :action => 'archive'


  match '/reports' => "reports/reports#index", :as => :reports
  namespace :reports do
    resource :report, :only => [:index] do
      get :registration_cause
      get :print_registration_cause
      get :accommodations
      get :print_accommodations
      get :health_status
      get :print_health_status
      get :cards_list
      get :print_cards_list
      get :payroll
      get :print_payroll
      get :families_structure
      get :print_families_structure
      get :card
      get :print_card
      get :cards_fill_control
      get :print_cards_fill_control
      get :form_11AIS
      get :print_form_11AIS
      get :form_11AIS_families
      get :print_form_11AIS_families
      get :cc_article
      get :print_cc_article
      get :employment_types
      get :print_employment_types
    end
  end

  match '/vocabularies' => "vocabularies/professions#index", :as => :vocabularies
  namespace :vocabularies do
    resources :professions, :except => [:show]
    resources :accommodations, :except => [:show]
    resources :categories, :except => [:show]
    resources :child_helps, :except => [:show]
    resources :company_types, :except => [:show]
    resources :doctors, :except => [:show]
    resources :document_types, :except => [:show]
    resources :employment_types, :except => [:show]
    resources :family_helps, :except => [:show]
    resources :family_structures, :except => [:show]
    resources :family_types, :except => [:show]
    resources :family_works, :except => [:show]
    resources :locations, :except => [:show]
    resources :privacy_document_types, :except => [:show]
    resources :registration_causes, :except => [:show]
    resources :registration_reasons, :except => [:show]
    resources :relationships, :except => [:show]
    resources :unregistration_causes, :except => [:show]
    resources :child_characters, :except => [:show]
    resources :departments, :except => [:show]
    resources :health_statuses, :except => [:show]
    resources :regions, :except => [:show]
    resources :districts, :except => [:show]
    resources :cities, :except => [:show]
    resources :towns, :except => [:show]
    resources :streets, :except => [:show]
    resources :cc_articles, :except => [:show]
  end

  resources :eventlogs, :only => [:index]
  resources :users
  resources :roles, :except => [:show]
  match 'settings' => "eventlogs#index", :as => :settings

  resource :account, :controller => "users"
  resource :user_session

  root :to => "cards#index"
end

