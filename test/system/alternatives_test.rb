require "application_system_test_case"

class AlternativesTest < ApplicationSystemTestCase
  setup do
    @alternative = alternatives(:one)
  end

  test "visiting the index" do
    visit alternatives_url
    assert_selector "h1", text: "Alternatives"
  end

  test "should create alternative" do
    visit alternatives_url
    click_on "New alternative"

    fill_in "Image data", with: @alternative.image_data
    fill_in "Orginal url", with: @alternative.orginal_url
    fill_in "Original source", with: @alternative.original_source
    fill_in "Title", with: @alternative.title
    fill_in "User", with: @alternative.user_id
    check "Verified" if @alternative.verified
    click_on "Create Alternative"

    assert_text "Alternative was successfully created"
    click_on "Back"
  end

  test "should update Alternative" do
    visit alternative_url(@alternative)
    click_on "Edit this alternative", match: :first

    fill_in "Image data", with: @alternative.image_data
    fill_in "Orginal url", with: @alternative.orginal_url
    fill_in "Original source", with: @alternative.original_source
    fill_in "Title", with: @alternative.title
    fill_in "User", with: @alternative.user_id
    check "Verified" if @alternative.verified
    click_on "Update Alternative"

    assert_text "Alternative was successfully updated"
    click_on "Back"
  end

  test "should destroy Alternative" do
    visit alternative_url(@alternative)
    click_on "Destroy this alternative", match: :first

    assert_text "Alternative was successfully destroyed"
  end
end
