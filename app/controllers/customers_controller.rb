class CustomersController < ApplicationController

    def show
      @customer = current_customer
    end

    def edit
      @customer = current_customer
    end

    def update
      
    end

    def leave
    end

    def withdraw
    end
end
