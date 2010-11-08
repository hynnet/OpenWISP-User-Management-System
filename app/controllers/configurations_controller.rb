class ConfigurationsController < ApplicationController
  before_filter :require_operator
 
  access_control :subject_method => :current_operator do
    default :deny

    allow :configurations_manager
  end

  def edit
    @configuration = Configuration.find(params[:id])
  end

  def update
    @configuration = Configuration.find(params[:id])
    if @configuration.update_attributes(params[:configuration])
      flash[:notice] = I18n.t(:Configuration_key_updated)
      redirect_to configurations_path
    else
      render :action => :edit
    end
  end

  def index
    @configurations = Configuration.find(:all, :order => "configurations.key")
  end

end