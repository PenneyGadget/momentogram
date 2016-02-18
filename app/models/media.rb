class Media
  attr_reader :image_url, :likes
  attr_accessor :location, :caption

  def initialize(params)
    @image_url = params[:image_url]
    @likes = params[:likes]
    @location = params[:location] || ""
    @caption = params[:caption] || ""
  end

end
