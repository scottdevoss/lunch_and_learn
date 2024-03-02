class Video
  attr_reader :id, :country, :title, :youtube_video_id
  def initialize(country, video)
    @id = nil
    @country = country
    @title = video[:snippet][:title]
    @youtube_video_id = video[:id][:videoId]
  end
end