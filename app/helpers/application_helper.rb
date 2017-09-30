module ApplicationHelper
  # https://www.pluralsight.com/guides/ruby-ruby-on-rails/ruby-on-rails-nested-attributes
  def link_to_add_fields(name = nil, f = nil, association = nil, options = nil, html_options = nil, &block)
    # Reassign values if a block is given (no name)
    f, association, options, html_options = name, f, association, options if block_given?

    options = {} if options.nil?
    html_options = {} if html_options.nil?
    locals = if options.include? :locals then options[:locals] else {} end
    partial = if options.include? :partial then options[:partial] else "#{association.to_s.singularize}_fields" end

    # Render form based on association
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for association, new_object, child_index: "new_record" do |builder|
      render(partial, locals.merge!(f: builder))
    end

    # Rendered fields are stored in data-form-prepend
    html_options["data-form-prepend"] = raw CGI::escapeHTML fields
    html_options["href"] = "#"

    content_tag :a, name, html_options, &block
  end
end
