class TemplateController < ApplicationController
  def index
    render partial: "templates/#{params[:name]}.tmpl"
  end
end
