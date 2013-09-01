module Api
  module V1
    class CountriesController < ApplicationController
      respond_to :json

      def index
        respond_with Country.order(:name)
      end
      
      def show
        respond_with Country.find(params[:id])
      end

      def create
        respond_with Product.create(params[:product])
      end
      
      def update
        respond_with Product.update(params[:id], params[:products])
      end
      
      def destroy
        respond_with Product.destroy(params[:id])
      end
    end
  end
end
