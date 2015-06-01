class RelatedProductsController < ApplicationController
  layout "admin" 

  before_action :set_related_product, only: [:show, :edit, :update, :destroy]

  # GET /related_products
  # GET /related_products.json
  def index
    @related_products = RelatedProduct.all
  end

  # GET /related_products/1
  # GET /related_products/1.json
  def show
  end

  # GET /related_products/new
  def new
    @related_product = RelatedProduct.new
  end

  # GET /related_products/1/edit
  def edit
  end

  # POST /related_products
  # POST /related_products.json
  def create
    @related_product = RelatedProduct.new(related_product_params)

    respond_to do |format|
      if @related_product.save
        format.html { redirect_to @related_product, notice: 'Related product was successfully created.' }
        format.json { render :show, status: :created, location: @related_product }
      else
        format.html { render :new }
        format.json { render json: @related_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /related_products/1
  # PATCH/PUT /related_products/1.json
  def update
    respond_to do |format|
      if @related_product.update(related_product_params)
        format.html { redirect_to @related_product, notice: 'Related product was successfully updated.' }
        format.json { render :show, status: :ok, location: @related_product }
      else
        format.html { render :edit }
        format.json { render json: @related_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /related_products/1
  # DELETE /related_products/1.json
  def destroy
    @related_product.destroy
    respond_to do |format|
      format.html { redirect_to related_products_url, notice: 'Related product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_related_product
      @related_product = RelatedProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def related_product_params
      params.require(:related_product).permit(:product_id, :related_product_id)
    end
end
