class ProductsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html

  def new
    product.build_picture
  end

  def edit
    product.build_picture unless product.picture.present?
  end

  def create
    if product.save
      flash[:notice] = t("labels.product_created_successfully")
      redirect_to products_url and return
    else
      product.build_picture unless product.picture.present?
      render :new
    end
  end

  def update
    if product.update_attributes(params[:product])
      flash[:notice] = t("labels.product_updated_successfully")
      redirect_to products_url and return
    else
      product.build_picture unless product.picture.present?
      render :edit
    end
  end

  def destroy
    product.destroy
    flash[:alert] = t("labels.product_deleted_successfully")
    redirect_to products_url and return
  end

  private
    def product
      @product ||= params[:id] ? Product.find(params[:id]) : Product.new(params[:product])
    end
    helper_method :product

    def products
      @products ||= Product.order(:name).page(params[:page]).per_page(PER_PAGE)
    end
    helper_method :products

    def categories
      @categories ||= Category.includes(:brands).order(:name)
    end
    helper_method :categories
end
