module Api
  module V1
    class CategoriesController < ApplicationController
      class Category < ::Category
        def as_json(options = {})
          super(only: [:id, :name])
        end
      end

      respond_to :json

      def index
        render json: Category.order(:name), callback: params[:callback]
      end

    end
  end
end
