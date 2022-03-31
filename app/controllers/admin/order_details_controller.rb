class Admin::OrderDetailsController < ApplicationController
   layout 'admin'
      before_action :authenticate_admin!
end
