class CompaniesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  
  
  # GET /companies
  # GET /companies.json
  def index
    @per_pages = 10
    @companies = Company.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(page: params[:page], per_page: @per_pages)
  end

  def export
    @companies = Company.search(params[:search]).order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.csv { send_data @companies.to_csv }
      format.xls
    end
  end
  
  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
        format.js
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :address, :active)
    end
    
    def sort_column
       Company.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
  
    def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
     end
     
   
end
