class Api::ProductsController < ApplicationController

  def index
    @products = Product.all 

    search_terms = params[:search]
    if search_terms
      @products = @products.where("name iLIKE ?", "%#{search_terms}%")
    end

    @products = @products.order(:id => :asc)

    render 'index.json.jbuilder'
  end

  def update
    @products = Products.find(params[:id])
    @products.name = params[:name] || @products.name
    @products.price = params[:price] || @products.price
    @products.description = params[:description] || @products.description
    render 'show.json.jbuilder'
  end

  def create
    @product = Product.new(
                           name: params[:name],
                           price: params[:price],
                           image_url: params[:image_url],
                           description: params[:description]
                           )
    if @product.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessible_entity
    end
  end
end
