module ApplicationHelper
    def numeric_class(value)
        return 'text-danger' unless value.is_a?(Numeric) && value.positive?
        'text-success'
      end    
end
