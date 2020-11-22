class Public::CustomersController < ApplicationController
  def my_page

  end

  def unsubscribe
      @customer = current_customer
  end
end
