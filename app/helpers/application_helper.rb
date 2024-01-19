module ApplicationHelper
    def numeric_class(value)
        return 'text-danger' unless value.is_a?(Numeric) && value.positive?
        'text-success'
      end   
      
      def format_backup_filename(filename)
        timestamp = DateTime.strptime(filename[/\d+/], '%Y%m%d%H%M%S')
        meses_en_espanol = %w[enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre]
        
        formatted_date = timestamp.strftime("Backup %d, #{meses_en_espanol[timestamp.month - 1]} %Y, %H:%M")
        formatted_date
      end
    end
