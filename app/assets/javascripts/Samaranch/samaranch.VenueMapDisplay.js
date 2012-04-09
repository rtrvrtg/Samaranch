// This should be requested with a params object containing:
// container - the container of the map area
// x_dst - the ID of the X coordinate field
// y_dst - the ID of the Y coordinate field

Samaranch.VenueMapDisplay = function(params) {
	
	var settings = {
		container: null,
		startZoom: 1
	};
	
	var state = {
		mapLoc: null
	};
	
	settings = Samaranch.setupParams(settings, params, {
		container: {
			type: Samaranch.Validator.COMPULSORY,
			title: 'Map Container'
		},
		startZoom: {
			type: Samaranch.Validator.OPTIONAL,
			title: 'Start Zoom'
		}
	});
	
	$('#' + settings.container).addClass('venue-map-display-active');
	
	var priv = {
		
		drawMarkers: function() {
			var mapId = $('#' + settings.container).attr('data-mapid');
			var base = Samaranch.Prefs.image_url_base || '/system';
			
			if (!!mapId) {
				$.getJSON('/venue_maps/' + mapId + '.json', {}, function(data){
					for (var i = 0; i < data.locations.length; i++) {
						var loc = data.locations[i].location;
						
						var markers = _.filter(data.markers, function(m){
							return m.marker.id == loc.marker_id;
						});
						
						if (markers.length > 0) {
							var url = base + 
							'/markers/original/' + markers[0].marker.id + '/' + 
							markers[0].marker.marker_image_file_name;
							
							state.mapLoc.addMarker(loc.x, loc.y, url, 
							markers[0].marker.anchor_x, 
							markers[0].marker.anchor_y);
						}
					}
				});
			}
		},
		
		init: function() {
			$('img', '#' + settings.container).load(function(){
				state.mapLoc = new Samaranch.MapLoc({
					container: settings.container,
					starter_image: $(this).attr('src'),
					touch_action: function(x, y){}
				});
				
				priv.drawMarkers();
			});
		}
		
	};
	
	var pub = {
		init: priv.init
	};
	
	pub.init();
	
	return pub;
	
};