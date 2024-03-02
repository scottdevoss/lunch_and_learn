class Video
  attr_reader :title, :youtube_video_id
  def initialize(video)
    # @id = nil
    # @country = country
    @title = video[:snippet][:title]
    @youtube_video_id = video[:id][:videoId]
  end
end