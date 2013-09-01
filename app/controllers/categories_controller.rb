class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def create
    if category.save
      flash[:notice] = t("labels.category_created_successfully")
      redirect_to categories_url and return
    else
      render :new
    end
  end

  def update
    if category.update_attributes(params[:category])
      flash[:notice] = t("labels.category_updated_successfully")
      redirect_to categories_url and return
    else
      render :edit
    end
  end

  def destroy
    category.destroy
    flash[:alert] = t("labels.category_deleted_successfully")
    redirect_to categories_url and return
  end

  private
    def category
      @category ||= params[:id] ? Category.includes(:brands).find(params[:id]) : Category.new(params[:category])
    end
    helper_method :category

    def categories
      @categories ||= Category.includes(:brands).order(:name).page(params[:page]).per_page(PER_PAGE)
    end
    helper_method :categories
end
