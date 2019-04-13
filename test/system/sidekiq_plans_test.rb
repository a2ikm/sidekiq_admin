require "application_system_test_case"

class SidekiqPlansTest < ApplicationSystemTestCase
  setup do
    @sidekiq_plan = sidekiq_plans(:one)
  end

  test "visiting the index" do
    visit sidekiq_plans_url
    assert_selector "h1", text: "Sidekiq Plans"
  end

  test "creating a Sidekiq plan" do
    visit sidekiq_plans_url
    click_on "New Sidekiq Plan"

    fill_in "Jid", with: @sidekiq_plan.jid
    fill_in "Label", with: @sidekiq_plan.label
    fill_in "Status", with: @sidekiq_plan.status
    fill_in "Worker name", with: @sidekiq_plan.worker_name
    click_on "Create Sidekiq plan"

    assert_text "Sidekiq plan was successfully created"
    click_on "Back"
  end

  test "updating a Sidekiq plan" do
    visit sidekiq_plans_url
    click_on "Edit", match: :first

    fill_in "Jid", with: @sidekiq_plan.jid
    fill_in "Label", with: @sidekiq_plan.label
    fill_in "Status", with: @sidekiq_plan.status
    fill_in "Worker name", with: @sidekiq_plan.worker_name
    click_on "Update Sidekiq plan"

    assert_text "Sidekiq plan was successfully updated"
    click_on "Back"
  end

  test "destroying a Sidekiq plan" do
    visit sidekiq_plans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sidekiq plan was successfully destroyed"
  end
end
