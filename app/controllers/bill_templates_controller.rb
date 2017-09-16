class BillTemplatesController < ApplicationController
  before_action :set_bill_template, only: [:show, :edit, :update, :destroy]

  # GET /bill_templates
  # GET /bill_templates.json
  def index
    @bill_templates = BillTemplate.all
  end

  # GET /bill_templates/1
  # GET /bill_templates/1.json
  def show
  end

  # GET /bill_templates/new
  def new
    @bill_template = BillTemplate.new
  end

  # GET /bill_templates/1/edit
  def edit
  end

  # POST /bill_templates
  # POST /bill_templates.json
  def create
    @bill_template = BillTemplate.new(bill_template_params)

    respond_to do |format|
      if @bill_template.save
        format.html { redirect_to @bill_template, notice: 'Bill template was successfully created.' }
        format.json { render :show, status: :created, location: @bill_template }
      else
        format.html { render :new }
        format.json { render json: @bill_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bill_templates/1
  # PATCH/PUT /bill_templates/1.json
  def update
    respond_to do |format|
      if @bill_template.update(bill_template_params)
        format.html { redirect_to @bill_template, notice: 'Bill template was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill_template }
      else
        format.html { render :edit }
        format.json { render json: @bill_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bill_templates/1
  # DELETE /bill_templates/1.json
  def destroy
    @bill_template.destroy
    respond_to do |format|
      format.html { redirect_to bill_templates_url, notice: 'Bill template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_template
      @bill_template = BillTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_template_params
      params.require(:bill_template).permit(:name, :amount, :reminder_template_id, :url, :triggered_at)
    end
end
