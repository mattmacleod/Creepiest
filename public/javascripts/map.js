creepiest.map = {
	
	init: function(){
		
		if( $("#main_map").length===0 ){ return; }
		
		this.load_google_maps();
		
	},
	
	load_google_maps: function(){
		
		google.load("maps", "2", {"callback" : creepiest.map.load});
	},
	
	load: function(){
				
		// Request JSON
		$.getJSON( $("#main_map").data("json-url") , function(data){
			
			// Enable the map
			$("#main_map").googleMaps( );
			
			// Create markers and info windows
			var markers = [];
			var bounds = new GLatLngBounds( );
			
			$.each(data, function(i,item){
				
				var location = new GLatLng( item.location.lat, item.location.lng);
				var marker   = new GMarker( location );
				
				markers.push( marker );
				bounds.extend( location );
				
			});
			
			// Add markers to map
			$.each(markers, function(i,v){
				$.googleMaps.gMap.addOverlay( v );
			});
			
			// Set the map zoom
			$.googleMaps.gMap.setCenter( bounds.getCenter( ), Math.min(16,$.googleMaps.gMap.getBoundsZoomLevel( bounds )) );
			
			
		});
		
		
	}
	
}