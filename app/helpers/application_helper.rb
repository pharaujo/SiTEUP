# Methods added to this helper will be available to all templates in the application.

# *IMPORTANT* This only works if the form object is the symbol :f,
# feel free to hack around if you find a way to circunvent this.

# *Update* (14/09/09)
# Using the options hash on add_child_link will fix the problem above.
module ApplicationHelper
  def remove_child_link(name, f)
    f.hidden_field(:_delete) + link_to_function(name, "remove_fields(this)")
  end

  def add_child_link(name, f, method, options = {})
    fields = new_child_fields(f, method, options)
    link_to_function(name, h("insert_fields(this, \"#{method}\", \"#{escape_javascript(fields)}\")"))
  end

  def new_child_fields(form_builder, method, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
    options[:partial] ||= method.to_s.singularize
    options[:form_builder_local] ||= :f
    form_builder.fields_for(method, options[:object], :child_index => "new_#{method}") do |f|
      render(:partial => options[:partial], :locals => { options[:form_builder_local] => f })
    end
  end
end
