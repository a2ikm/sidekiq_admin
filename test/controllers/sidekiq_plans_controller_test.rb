require 'test_helper'

class SidekiqPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sidekiq_plan = sidekiq_plans(:one)
  end

  test "should get index" do
    get sidekiq_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_sidekiq_plan_url
    assert_response :success
  end

  test "should create sidekiq_plan" do
    assert_difference('SidekiqPlan.count') do
      post sidekiq_plans_url, params: { sidekiq_plan: { jid: @sidekiq_plan.jid, label: @sidekiq_plan.label, status: @sidekiq_plan.status, worker_name: @sidekiq_plan.worker_name } }
    end

    assert_redirected_to sidekiq_plan_url(SidekiqPlan.last)
  end

  test "should show sidekiq_plan" do
    get sidekiq_plan_url(@sidekiq_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_sidekiq_plan_url(@sidekiq_plan)
    assert_response :success
  end

  test "should update sidekiq_plan" do
    patch sidekiq_plan_url(@sidekiq_plan), params: { sidekiq_plan: { jid: @sidekiq_plan.jid, label: @sidekiq_plan.label, status: @sidekiq_plan.status, worker_name: @sidekiq_plan.worker_name } }
    assert_redirected_to sidekiq_plan_url(@sidekiq_plan)
  end

  test "should destroy sidekiq_plan" do
    assert_difference('SidekiqPlan.count', -1) do
      delete sidekiq_plan_url(@sidekiq_plan)
    end

    assert_redirected_to sidekiq_plans_url
  end
end
