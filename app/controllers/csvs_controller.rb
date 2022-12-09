class CsvsController < ApplicationController
  rescue_from MySQLBinUUID::InvalidUUID, with: :invalid_uuid

  def index
    @csvs = current_user.csvs.order(created_at: :desc)
  end

  def new
    @csv = Csv.new
  end

  def create
    file = params[:csv][:csv_file] if params[:csv].present?
    if file.present?
      return redirect_to new_csv_path, alert: 'Please use only CSV files.' unless file.content_type == 'text/csv'

      new_filename = Csv.rename_file(file.original_filename)

      # new file name
      csv_params[:csv_file].original_filename = new_filename

      # building csv object
      @csv = Csv.new(csv_params)
      @csv.user_id = current_user.id
      @csv.file_name = new_filename
      @csv.url = @csv.csv_file.url

      respond_to do |format|
        if @csv.save
          # send S3 link to the request bin
          ExternalService.new.send_url(@csv.url)
          # Run csv import
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
