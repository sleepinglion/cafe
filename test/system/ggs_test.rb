require "application_system_test_case"

class GgsTest < ApplicationSystemTestCase
  setup do
    @gg = ggs(:one)
  end

  test "visiting the index" do
    visit ggs_url
    assert_selector "h1", text: "Ggs"
  end

  test "creating a Gg" do
    visit ggs_url
    click_on "New Gg"

    click_on "Create Gg"

    assert_text "Gg was successfully created"
    click_on "Back"
  end

  test "updating a Gg" do
    visit ggs_url
    click_on "Edit", match: :first

    click_on "Update Gg"

    assert_text "Gg was successfully updated"
    click_on "Back"
  end

  test "destroying a Gg" do
    visit ggs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gg was successfully destroyed"
  end
end
