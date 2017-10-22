class ReminderTemplatesController < ApplicationController
  before_action :set_reminder_template, only: [:show, :edit, :update, :destroy, :trigger]

  # GET /reminder_templates
  # GET /reminder_templates.json
  def index
    @reminder_templates = ReminderTemplate.all
  end

  # GET /reminder_templates/1
  # GET /reminder_templates/1.json
  def show
  end

  # GET /reminder_templates/new
  def new
    @reminder_template = ReminderTemplate.new
    @reminder_template.bill_templates.build
  end

  # GET /reminder_templates/1/edit
  def edit
  end

  # POST /reminder_templates/1/trigger
  def trigger
    respond_to do |format|
      if @reminder_template.trigger
        format.html {
          redirect_to root_url, notice: 'Reminder template was successfully triggered.'
        }
      end
    end
  end

  # POST /reminder_templates
  # POST /reminder_templates.json
  def create
    @reminder_template = ReminderTemplate.new(reminder_template_params)

    respond_to do |format|
      if @reminder_template.save
        format.html { redirect_to @reminder_template, notice: 'Reminder template was successfully created.' }
        format.json { render :show, status: :created, location: @reminder_template }
      else
        format.html { render :new }
        format.json { render json: @reminder_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reminder_templates/1
  # PATCH/PUT /reminder_templates/1.json
  def update
    respond_to do |format|
      if @reminder_template.update(reminder_template_params)
        format.html { redirect_to @reminder_template, notice: 'Reminder template was successfully updated.' }
        format.json { render :show, status: :ok, location: @reminder_template }
      else
        format.html { render :edit }
        format.json { render json: @reminder_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminder_templates/1
  # DELETE /reminder_templates/1.json
  def destroy
    @reminder_template.destroy
    respond_to do |format|
      format.html { redirect_to reminder_templates_url, notice: 'Reminder template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reminder_template
      @reminder_template = ReminderTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reminder_template_params
      params.require(:reminder_template).permit(:name, :frequency, :triggered_at, :bill_templates_attributes => [:id, :_delete, :name, :amount, :url])
    end
end
