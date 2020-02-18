<%= form_tag monuments_path, method: :get do %>
  <%= text_field_tag :query,
    params[:query],
    class: "form-control",
    placeholder: "Find a monument"
  %>
  <%= submit_tag "Search", class: "btn btn-primary" %>
<% end %>
