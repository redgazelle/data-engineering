class PurchaseBatchesController < ApplicationController
  before_action :set_purchase_batch, only: [:show, :update, :destroy]

  # GET /purchase_batches
  # GET /purchase_batches.json
  def index
    @purchase_batches = PurchaseBatch.all
  end

  # GET /purchase_batches/1
  # GET /purchase_batches/1.json
  def show
  end

  # GET /purchase_batches/new
  def new
    @purchase_batch = PurchaseBatch.new
  end

  # POST /purchase_batches
  # POST /purchase_batches.json
  def create
    file = params[:purchase_batch][:file]
    @purchase_batch = PurchaseBatch.create_from_file(file.tempfile)
    notice = @purchase_batch.import_errors.present? ? @purchase_batch.import_errors : 'Purchase batch was successfully created.'
    redirect_to @purchase_batch, notice: notice
  end

  # PATCH/PUT /purchase_batches/1
  # PATCH/PUT /purchase_batches/1.json
  def update
    respond_to do |format|
      if @purchase_batch.update(purchase_batch_params)
        format.html { redirect_to @purchase_batch, notice: 'Purchase batch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @purchase_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_batches/1
  # DELETE /purchase_batches/1.json
  def destroy
    @purchase_batch.destroy
    respond_to do |format|
      format.html { redirect_to purchase_batches_url }
      format.json { head :no_content }
    end
  end

  private

    def set_purchase_batch
      @purchase_batch = PurchaseBatch.find(params[:id])
    end

    def purchase_batch_params
      params.require(:purchase_batch).permit(:file)
    end
end
