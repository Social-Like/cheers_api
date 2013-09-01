class CountriesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def create
    if country.save
      flash[:notice] = t("labels.country_created_successfully")
      redirect_to countries_url and return
    else
      render :new
    end
  end

  def update
    if country.update_attributes(params[:country])
      flash[:notice] = t("labels.country_updated_successfully")
      redirect_to countries_url and return
    else
      render :edit
    end
  end

  def destroy
    country.destroy
    flash[:alert] = t("labels.country_deleted_successfully")
    redirect_to countries_url and return
  end

  private
    def country
      @country ||= params[:id] ? Country.find(params[:id]) : Country.new(params[:country])
    end
    helper_method :country

    def countries
      @countries ||= Country.order(:name).page(params[:page]).per_page(PER_PAGE)
    end
    helper_method :countries
end
