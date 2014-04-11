module Menu
  module InstanceMethods
    def init_main_menu(menu)
      @main_menu = menu
      @main_menu.each { |item| item[:active] = false }
    end

    def init_sub_menu(menu)
      @sub_menu = menu
      @sub_menu.each_value do |groups|
        groups.each do |group|
          group[:items].each { |item| item[:active] = false }
        end
      end
    end

    def set_menu(selected_item, menu)
      for item in menu
        #item[:active] = true if item[:url].match("/#{selected_item}")
        item[:active] = true if item[:url].match("/#{selected_item}")
      end if menu
    end

    def set_main_menu(menu)
      @current_main_menu = menu
      set_menu(menu, @main_menu)
    end

    def set_sub_menu(menu)
  	  @sub_menu[@current_main_menu].each do |group|
	      set_menu(menu, group[:items])
      end
    end
  end

  module ClassMethods
    def set_main_menu(menu)
      before_filter do |controller|
        controller.send(:set_main_menu, menu)
      end
    end

    def set_sub_menu(menu)
      before_filter do |controller|
        controller.send(:set_sub_menu, menu)
      end
    end
  end

  module HelperMethods
    def tag_menu(menu, options = {})
      tag = ""
      if menu
        menu.each do |item|
          tag += tag_menu_item(item, options)
        end
      end
      tag
    end

    def tag_main_menu
      tag_menu(@main_menu).html_safe
    end

    def tag_sub_menu
  	  s = ""
  	  @sub_menu[@current_main_menu].each do |group|
        s += content_tag :li do
          p = content_tag :h2, group[:title]
          p += content_tag :ul do
            tag_menu(group[:items])
          end
        end
      end
      s.html_safe
    end

    def tag_menu_item(item, options = {})
      if item[:title] == "-"
        content_tag(:li, '&nbsp;'.html_safe)
      else
        tag_class = item[:class] if item[:class]
        tag_class = "#{tag_class} active" if item[:active]
        content_tag(:li, link_to(item[:title], item[:url]), :class => tag_class)
      end
    end
  end
end

class ActionController::Base
  include Menu::InstanceMethods
  extend Menu::ClassMethods
end

class ActionView::Base
  include Menu::HelperMethods
end

