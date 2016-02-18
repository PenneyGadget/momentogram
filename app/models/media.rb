class Media
  attr_reader :image_url, :likes, :media_id, :comments
  attr_accessor :location, :caption

  def initialize(params)
    @image_url = params[:image_url]
    @likes = params[:likes]
    @location = params[:location] || ""
    @caption = params[:caption] || ""
    @media_id = params[:media_id]
    @comments = params[:comments]
  end

end
