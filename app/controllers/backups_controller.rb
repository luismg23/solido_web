class BackupsController < ApplicationController

    def index
        @backups = Backup.all
    end

    def create
        generate_backup
        redirect_to backups_path, notice: 'Respaldo completado correctamente'
    end

    def destroy
        delete_backup(params['backup_id'])
        redirect_to backups_path, notice: 'Respaldo eliminado'
    end

    def format_backup_filename(filename)
        timestamp = DateTime.strptime(filename[/\d+/], '%Y%m%d%H%M%S')
        formatted_date = timestamp.strftime('Backup %d, %B %Y, %H:%M')
        formatted_date
    end

  private

    def generate_backup
        Backup.generate_backup
    end

    def delete_backup(backup_id)
        Backup.delete_backup(extract_backup_id(backup_id))
    end

    def extract_backup_id(backup_id)
        match = backup_id.match(/backups\/(backup_\d+)\.sql/)
        match[1] if match
    end  
end