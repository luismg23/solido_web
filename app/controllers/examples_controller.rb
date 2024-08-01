class ExamplesController < ApplicationController
    layout false
  
    def show
      Rails.logger.info "daaaa"
      respond_to do |format|
        format.html
      end
    end
  
  
    def increment
      Rails.logger.info "olala"
      @count = element.dataset.count.to_i + element.dataset.step.to_i
    end
  
  end
  