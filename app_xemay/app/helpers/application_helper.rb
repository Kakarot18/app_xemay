module ApplicationHelper
  def link_to_remove_fields name, f
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields name, f, association
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, child_index: "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def link_to_function name, function, html_options = {}
    message = t "message-link-to-function"
    ActiveSupport::Deprecation.warn message
    onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
    href = html_options[:href] || '#'
    content_tag :a, name, html_options.merge(href: href, onclick: onclick)
  end

  def created_mins time
    ((Time.now - time)/ 60).round
  end

  def created_hours time
    ((Time.now - time)/ 1.hour).round
  end

  def created_days time
    ((Time.now - time)/ 1.day).round
  end

  def created_months time
    ((Time.now - time)/ 1.month).round
  end

  def created_years time
    ((Time.now - time)/ 1.year).round
  end
end
