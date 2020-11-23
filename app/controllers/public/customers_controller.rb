class Public::CustomersController < ApplicationController
  def my_page

  end

  def unsubscribe
      @customer = current_customer
  end

   def withdraw
        @customer = current_customer
        #is_deletedカラムにフラグを立てる(defaultはfalse)
        @customer.update(is_deleted: true)
        #ログアウトさせる
        reset_session
        redirect_to root_path
   end
end
