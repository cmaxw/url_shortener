require "application_system_test_case"

class RedirectionsTest < ApplicationSystemTestCase
  setup do
    @redirection = redirections(:one)
  end

  test "visiting the index" do
    visit redirections_url
    assert_selector "h1", text: "Redirections"
  end

  test "should create redirection" do
    visit redirections_url
    click_on "New redirection"

    fill_in "Destination url", with: @redirection.destination_url
    fill_in "Source path", with: @redirection.source_path
    click_on "Create Redirection"

    assert_text "Redirection was successfully created"
    click_on "Back"
  end

  test "should update Redirection" do
    visit redirection_url(@redirection)
    click_on "Edit this redirection", match: :first

    fill_in "Destination url", with: @redirection.destination_url
    fill_in "Source path", with: @redirection.source_path
    click_on "Update Redirection"

    assert_text "Redirection was successfully updated"
    click_on "Back"
  end

  test "should destroy Redirection" do
    visit redirection_url(@redirection)
    click_on "Destroy this redirection", match: :first

    assert_text "Redirection was successfully destroyed"
  end
end
