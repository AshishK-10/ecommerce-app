class Admin::StocksController < AdminController
  before_action :set_admin_product_stock, only: %i[ show edit update destroy]

  # GET /admin/product/stocks or /admin/product/stocks.json
  def index
    @admin_product_stocks = params[:product_id].present? ? Stock.where(product_id: params[:product_id]) : Stock.all
  end

  # GET /admin/product/stocks/1 or /admin/product/stocks/1.json
  def show
  end

  # GET /admin/product/stocks/new
  def new
    @product = Product.find(params[:product_id])
    @admin_product_stock = @product.stocks.new
  end

  # GET /admin/product/stocks/1/edit
  def edit
  end

  # POST /admin/product/stocks or /admin/product/stocks.json
  def create
    @admin_product_stock = Stock.new(admin_product_stock_params)

    respond_to do |format|
      if @admin_product_stock.save
        format.html { redirect_to admin_stock_url(@admin_product_stock), notice: "Stock was successfully created." }
        format.json { render :show, status: :created, location: @admin_product_stock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_product_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/product/stocks/1 or /admin/product/stocks/1.json
  def update
    respond_to do |format|
      if @admin_product_stock.update(admin_product_stock_params)
        format.html { redirect_to admin_stock_url(@admin_product_stock), notice: "Stock was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_product_stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_product_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/product/stocks/1 or /admin/product/stocks/1.json
  def destroy
    @admin_product_stock.destroy
    respond_to do |format|
      format.html { redirect_to admin_product_stocks_url(@product), notice: "Stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def product_stocks
    puts "entered here!"
    puts params
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product_stock
      @admin_product_stock = Stock.find(params[:id])
      @product = Product.find(@admin_product_stock.product_id) if @admin_product_stock
    end

    # Only allow a list of trusted parameters through.
    def admin_product_stock_params
      params.require(:stock).permit(:size, :amount, :product_id)
    end
end
