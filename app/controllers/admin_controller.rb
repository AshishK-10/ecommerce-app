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
            name: "Product",
            icon: "cart-shopping",
            path: admin_path
            },

            {
            name: "Categories",
            icon: "list",
            path: admin_categories_path
            },

            {
            name: "Orders",
            icon: "truck-fast",
            path: admin_path
            },
        ]
    end
end
