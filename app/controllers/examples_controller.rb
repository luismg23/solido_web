class ExamplesController < ApplicationController
    layout false
  
    def show
      respond_to do |format|
        format.html
      end
    end
  
  
    def increment
      @count = element.dataset.count.to_i + element.dataset.step.to_i
    end
  
  end
  