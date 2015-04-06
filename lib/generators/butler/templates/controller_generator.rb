<% if namespaced? -%>
require_dependency '<%= namespaced_file_path %>/application_controller'

<% end -%>
<% module_namespacing do -%>
class <%= prefixed_controller_class_name %>Controller < <%= parent_controller_class_name %>Controller

  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]

  def index
    @<%= plural_table_name %> = <%= class_name %>.page(params[:page])
  end

  def show
  end

  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
  end

  def edit
  end

  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>

    if @<%= orm_instance.save %>
      redirect_to <%= "[:#{prefix}, @#{singular_table_name}]" %>, notice: t('controller.create', resource: <%= class_name %>.model_name.human, default: :'butler.controller.create')
    else
      render action: 'new'
    end
  end

  def update
    if @<%= orm_instance.update("#{singular_table_name}_params") %>
      redirect_to <%= "[:#{prefix}, @#{singular_table_name}]" %>, notice: t('controller.update', resource: <%= class_name %>.model_name.human, default: :'butler.controller.update')
    else
      render action: 'edit'
    end
  end

  def destroy
    @<%= orm_instance.destroy %>
    redirect_to <%= prefixed_index_helper %>_url, notice:  t('controller.destroy', resource: <%= class_name %>.model_name.human, default: :'butler.controller.destroy')
  end

  private
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    end

    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params[<%= ":#{singular_table_name}" %>]
      <%- else -%>
      params.require(<%= ":#{singular_table_name}" %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
      <%- end -%>
    end
end
<% end -%>
