# config/routes.rb
Rails.application.routes.draw do
  resources :projects, only: [:index]
end

# app/controllers/projects_controller.rb
class ProjectsController < ApplicationController
  def index
    render json: Project.all
  end
end
