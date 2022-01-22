class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :authorize_user!, only: %i[edit update destroy]
  helper_method :sort_column, :sort_direction
  # GET /listings or /listings.json
  def index
    @categories = Category.all
    if params[:category_id]
      @listings = Listing.where("category_id =" + params[:category_id]).order("#{sort_column} #{sort_direction}")
    else
      @listings = Listing.all.order("#{sort_column} #{sort_direction}")
    end
  end

  # GET /listings/1 or /listings/1.json
  def show

  end

  def sortable_columns
    ["title", "price", "created_at"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def search
    if params[:category_id]
      @listings = Listing.where("category_id =" + params[:category_id] + "AND lower(Title) LIKE ?", "%" + params[:q].downcase + "%").order("#{sort_column} #{sort_direction}")
      else
    @listings = Listing.where("lower(Title) LIKE ?", "%" + params[:q].downcase + "%").all.order("#{sort_column} #{sort_direction}")
    end
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end


  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
      # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :price, :listing_type, :description, :status, :category_id, [:image] )
    end

  def authorize_user!
    redirect_back fallback_location: root_path, alert: 'Nimate dostopa do te strani.' unless current_user == @listing.user
  end
  end