class ShortenedUrlsController < ApplicationController
  before_action :set_shortened_url, only: [:show, :real_url]

  # GET /top
  def top
    @shortened_urls = ShortenedUrl.all.order(use_count: :desc).limit(100).select(:id, :url, :title, :unique_key, :use_count)

    render json: @shortened_urls
  end

  def real_url
    @shortened_url.use_count += 1
    @shortened_url.save
    redirect_to @shortened_url.url
  end

  # GET /shortened_urls/1
  def show
    render json: shortened_url(@shortened_url.unique_key)
  end

  def shortened_url(unique_key)
    {shortened_url: request.host_with_port + '/' + unique_key}
  end

  def generate_token
    loop do
      token = SecureRandom.alphanumeric(5)
      break token unless ShortenedUrl.where(unique_key: token).exists?
    end
  end

  # POST /shortened_urls
  def create
    @shortened_url = ShortenedUrl.new(shortened_url_params)
    @shortened_url.unique_key = generate_token

    if @shortened_url.save
      Resque.enqueue(PageTitle, @shortened_url.id)
      render json: shortened_url(@shortened_url.unique_key), status: :created, location: @shortened_url
    else
      render json: @shortened_url.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shortened_url
    @shortened_url = ShortenedUrl.find_by(unique_key: params[:unique_key])
  end

  # Only allow a trusted parameter "white list" through.
  def shortened_url_params
    params.require(:shortened_url).permit(:url)
  end
end
