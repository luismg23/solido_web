module ApplicationHelper
    MESES_ESPANOL = %w(Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre)

  def formato_fecha_espanol(fecha)
    fecha_localizada = fecha.respond_to?(:to_date) ? fecha.to_date : Date.parse(fecha.to_s)
    mes_en_espanol = MESES_ESPANOL[fecha_localizada.month - 1]  # Restamos 1 ya que los meses comienzan desde 1
    fecha_localizada.strftime("%d de #{mes_en_espanol} de %Y")
  end

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

      def formato_fecha_espanol(fecha)
        fecha_localizada = fecha.respond_to?(:to_date) ? fecha.to_date : Date.parse(fecha.to_s)
        mes_en_espanol = MESES_ESPANOL[fecha_localizada.month - 1]  # Restamos 1 ya que los meses comienzan desde 1
        fecha_localizada.strftime("%d de #{mes_en_espanol} de %Y")
      end
end
