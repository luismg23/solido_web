class Backup
    include HTTParty
    base_uri 'http://127.0.0.1:3000'
    include ActiveModel::Model
    attr_accessor :cve_banco, :sucursal_banco, :direccion_banco, :telefono_banco, :nombre_banco, :IdInterno, :empresa_fk
  
    def initialize(attributes = {})
      @cve_banco = attributes[:cve_banco]
      @sucursal_banco = attributes[:sucursal_banco]
      @direccion_banco = attributes[:direccion_banco]
      @telefono_banco = attributes[:telefono_banco]
      @nombre_banco = attributes[:nombre_banco]
      @IdInterno = attributes[:IdInterno]
      @empresa_fk = attributes[:empresa_fk]
  
    end
  
    #def self.all(page = 1, per_page = 10)
    #  @request_ = RequestHandler.new('banks')
    #  @request_.all
    #end
  
    def self.all()
      response = get("/backups/")
      response.parsed_response
    end

    def self.generate_backup
      response = get("/backups/show")
      response
    end

    def self.delete_backupddd(id)
      response = get("/backups/by_company_id/#{id}")
      response.code
    end
  
    def self.by_company_id(id)
      response = get("/banks/by_company_id/#{id}")
      response.parsed_response
    end
  
    def self.delete_backup(filename)
      response = HTTParty.delete(
        "#{base_uri}/backups/#{filename}",
        headers: {
              'Content-Type' => 'application/json'
            }
        )
        response.code
    end  
  end
  