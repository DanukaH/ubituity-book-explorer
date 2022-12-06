class CsvsController < ApplicationController
  rescue_from MySQLBinUUID::InvalidUUID, with: :invalid_uuid

  def index
    @csvs = current_user.csvs
  end

  def new
    @csv = Csv.new
  end

  def create
    file = params[:csv][:csv_file] if params[:csv].present?
    if file.present?
      return redirect_to new_csv_path, alert: 'Please use only CSV files.' unless file.content_type == 'text/csv'

      @csv = Csv.new
      @csv.user_id = current_user.id
      @csv.file_name = Csv.rename_file(file.original_filename)

      respond_to do |format|
        if @csv.save
          CsvImportBooksService.new.call(file, @csv.id)
          format.html { redirect_to csv_books_path(@csv), notice: 'CSV file was successfully saved and imported.' }
          format.json { render :show, status: :created, location: @csv }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @csv.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to new_csv_path, alert: 'Please select a file.'
    end
  end

  private

  def csv_params
    params.require(:csv).permit(:csv_file)
  end

  def invalid_uuid(error)
    redirect_to csv_books_url, alert: "Process has been stopped: The Unique Identifier #{error}"
  end

end
