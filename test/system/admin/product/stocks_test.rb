require "application_system_test_case"

class Admin::Product::StocksTest < ApplicationSystemTestCase
  setup do
    @admin_product_stock = admin_product_stocks(:one)
  end

  test "visiting the index" do
    visit admin_product_stocks_url
    assert_selector "h1", text: "Stocks"
  end

  test "should create stock" do
    visit admin_product_stocks_url
    click_on "New stock"

    fill_in "Amount", with: @admin_product_stock.amount
    fill_in "Product", with: @admin_product_stock.product_id
    fill_in "Size", with: @admin_product_stock.size
    click_on "Create Stock"

    assert_text "Stock was successfully created"
    click_on "Back"
  end

  test "should update Stock" do
    visit admin_product_stock_url(@admin_product_stock)
    click_on "Edit this stock", match: :first

    fill_in "Amount", with: @admin_product_stock.amount
    fill_in "Product", with: @admin_product_stock.product_id
    fill_in "Size", with: @admin_product_stock.size
    click_on "Update Stock"

    assert_text "Stock was successfully updated"
    click_on "Back"
  end

  test "should destroy Stock" do
    visit admin_product_stock_url(@admin_product_stock)
    click_on "Destroy this stock", match: :first

    assert_text "Stock was successfully destroyed"
  end
end
