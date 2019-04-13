class SidekiqPlansController < ApplicationController
  before_action :set_sidekiq_plan, only: [:show, :edit, :update, :destroy]

  # GET /sidekiq_plans
  def index
    @sidekiq_plans = SidekiqPlan.all
  end

  # GET /sidekiq_plans/1
  def show
  end

  # GET /sidekiq_plans/new
  def new
    @sidekiq_plan = SidekiqPlan.new
  end

  # GET /sidekiq_plans/1/edit
  def edit
  end

  # POST /sidekiq_plans
  def create
    @sidekiq_plan = SidekiqPlan.new(sidekiq_plan_params)

    if @sidekiq_plan.save
      redirect_to @sidekiq_plan, notice: 'Sidekiq plan was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sidekiq_plans/1
  def update
    if @sidekiq_plan.update(sidekiq_plan_params)
      redirect_to @sidekiq_plan, notice: 'Sidekiq plan was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sidekiq_plans/1
  def destroy
    @sidekiq_plan.destroy
    redirect_to sidekiq_plans_url, notice: 'Sidekiq plan was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sidekiq_plan
      @sidekiq_plan = SidekiqPlan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sidekiq_plan_params
      params.require(:sidekiq_plan).permit(:label, :worker_name, :jid, :status)
    end
end
