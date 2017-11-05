require 'redtube/redtube'

module Redtube
   class Videos
     include Redtube::Base

     def search(params)
       @@params.merge!(params)
       run_to_api "redtube.Videos.searchVideos"
     end

     def get_video(id, thumbsize = "all")
       @@params[:video_id] = id
       @@params[:thumbsize] = thumbsize
       run_to_api "redtube.Videos.getVideoById"
     end

     def is_active?(id)
       @@params[:video_id] = id
       result = run_to_api "redtube.Videos.isVideoActive"
       if result[:is_active] == 1
         return true
       end
       return false
     end

     def embed(id)
       if self.is_active? id
         run_to_api "redtube.Videos.getVideoEmbedCode"
       return false
     end
   end
end