class AdminController < ApplicationController
    before_action :authenticate_admin!
    helper_method :navs_names
    layout 'admin'
    def index
        puts current_admin.inspect
    end

    private

    def navs_names
        [
            {
            name: "Dashboard",
            icon: "gauge-high",
            path: admin_path
            },

            {
            name: "Products",
            icon: "cart-shopping",
            path: admin_products_path
            },

            {
            name: "Categories",
            icon: "list",
            path: admin_categories_path
            },

            {
            name: "Orders",
            icon: "truck-fast",
            path: admin_orders_path
            },

            {
            name: "Sign out",
            icon: "fa-solid fa-right-from-bracket",
            path: destroy_admin_session_path,
            data: { "turbo-method": :delete, "turbo-confirm": "Are you sure you want to sign out?" }
            },
        ]
    end
end
