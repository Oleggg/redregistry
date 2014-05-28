module ApplicationHelper
  def title(page_title)
    content_for(:title) { "#{page_title.to_s} - Red Registry" }
  end

  def javascript_include_yandex_map_api
    #content_for(:yandex_maps_api) { javascript_include_tag "http://api-maps.yandex.ru/1.1/index.xml?key=#{Settings.key}" } # API v1.0
    content_for(:yandex_maps_api) { javascript_include_tag "http://api-maps.yandex.ru/2.0/?load=package.standard&mode=debug&lang=ru-RU" } # API v2.0
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + button_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new

    # small hack
    new_object.build_person if new_object.is_a?(Relative)

    #new_object.build_person if new_object.is_a?(CardPrivacyDocumentType)
    #new_object.build_person if new_object.is_a?(CardChildHelp)
    #new_object.build_family_help if new_object.is_a?(CardFamilyHelp)
    #new_object.build_child_character if new_object.is_a?(CardChildCharacter)

    #new_object.build_person if new_object.is_a?(Relative)

    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    button_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")".html_safe )
  end

  def th_sort(param)
    result = 'class="sortup"' if params[:sort] == param
    result = 'class="sortdown"' if params[:sort] == param + "_reverse"
    return result
  end

  def th_sort_link(text, param)
    key = param
    key += "_reverse" if params[:sort] == param
    options = {
        :url => {:action => 'index', :params => params.merge({:sort => key })},
#        :update => 'content',
#        :url => {:action => 'index', :params => {:sort => key }},
#        :action => 'index',:sort => key,:update => 'content',
    }
    html_options = {
      :title => "Sort by this field",
      :href => url_for(:action => 'index', :params => params.merge({:sort => key }))
    }
#    link_to_remote(text, options, html_options)
#    link_to text,options,:href => url_for(:action => 'index', :params => params.merge({:sort => key }))
#    link_to text, { :update => 'content',:sort => key }, :remote => true
    #link_to text,{ :sort => key }#, :remote => true
    #link_to text,{ :sort => key },:update => "table", :remote => true
    #link_to text,{ :sort => key }, :remote => true,:id => "sort_link"
    link_to text, { :sort => key },:id => "sort_link"
    #link_to text,options,:href => url_for(:action => 'index', :params => params.merge({:sort => key }))
  end


  def city_by_district(id)
    cities = City.where(:district_id => id ).all
    ActiveSupport::JSON.encode(cities,:only => :name)
    return cities
  end

end

