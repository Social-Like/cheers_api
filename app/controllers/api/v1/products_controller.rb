module Api
  module V1
    class ProductsController < ApplicationController
      class Product < ::Product
        def as_json(options = {})
          super(only: [:id, :name, :description, :category_id, :brand_id, :country_id], methods: [:category_name, :brand_name, :country_name, :picture_list])
        end
      end
      class Category < ::Category
        def as_json(options = {})
          super(only: [:id, :name])
        end
      end

      respond_to :json

      def index
        products = Product.includes(:country, :picture, :brand, :category).order(:name)
        products = products.where(category_id: params[:category_id]) if params[:category_id]
        category = Category.unscoped.select([:id, :name]).where(id: params[:category_id]).first rescue nil

        #render json: { category: {id: category.try(:id), name: category.try(:name)}, products: products.to_json }, callback: params[:callback]
        render json: { category: category.to_json, products: products.to_json }, callback: params[:callback]
      end

    end
  end
end
