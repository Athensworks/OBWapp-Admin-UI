module ApplicationHelper

  def google_map(lat, lon, zoom=18)
    text = %{
      <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=#{ENV["GOOGLE_MAPS_KEY"]}&sensor=false">https://maps.googleapis.com/maps/api/js?key=#{ENV["GOOGLE_MAPS_KEY"]}</script>
      <style type="text/css">#gmap_canvas img{max-width:none!important;background:none!important}</style>

      <div style="overflow:hidden;height:500px;width:600px;">
        <div id="gmap_canvas" style="height:500px;width:600px;"></div><a class="google-map-code" href="http://www.map-embed.com" id="get-map-data" name="get-map-data">map-embed.com</a>
      </div>

      <script type="text/javascript">function init_map(){var myOptions = {zoom:#{zoom},center:new google.maps.LatLng(#{lat},#{lon}),mapTypeId: google.maps.MapTypeId.ROADMAP};map = new google.maps.Map(document.getElementById("gmap_canvas"), myOptions);marker = new google.maps.Marker({map: map,position: new google.maps.LatLng(#{lat}, #{lon})});}google.maps.event.addDomListener(window, 'load', init_map);</script>
    }

    Rails.logger.info text

    text.html_safe
  end
end
