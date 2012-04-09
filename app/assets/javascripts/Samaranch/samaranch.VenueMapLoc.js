// This should be requested with a params object containing:
// container - the container of the map area
// x_dst - the ID of the X coordinate field
// y_dst - the ID of the Y coordinate field

Samaranch.VenueMapLoc = function(params) {
	
	var settings = {
		container: null,
		x_dst: null,
		y_dst: null,
		mapswitch: null
	};
	
	var state = {
		mapLoc: null,
		ctx: null,
		c_width: 0,
		c_height: 0,
		img: null,
		img_src: null
	};
	
	var base = Samaranch.Prefs.image_url_base || '/system';
	
	settings = Samaranch.setupParams(settings, params, {
		container: {
			type: Samaranch.Validator.COMPULSORY,
			title: 'Map Container'
		},
		x_dst: {
			type: Samaranch.Validator.COMPULSORY,
			title: 'X Destination Field'
		},
		y_dst: {
			type: Samaranch.Validator.COMPULSORY,
			title: 'Y Destination Field'
		},
		mapswitch: {
			type: Samaranch.Validator.COMPULSORY,
			title: 'Map Switcher'
		}
	});
	
	$('#' + settings.container).addClass('venue-map-loc-active');
	
	var priv = {
		
		getMap: function() {
			var mapId = $('#' + settings.mapswitch).val();
			
			if (!!mapId) {
				$.getJSON('/venue_maps/' + mapId + '.json', {}, function(data){
					var url = base + '/venue_maps/' + data.venue_map.venue_map.id + 
							  '/original/' + data.venue_map.venue_map.map_image_file_name;
					
					state.mapLoc.changeImage(url);
					
					var x = $('#' + settings.x_dst).val(),
					y = $('#' + settings.y_dst).val();
					
					if (!!x && !!y) {
						state.mapLoc.touch(x, y);
					}
				});
			}
		},
		
		setupTriggers: function() {
			$('#' + settings.mapswitch).change(function(){
				priv.getMap();
			});
		},
		
		hideXY: function() {
			$('#' + settings.x_dst + ', #' + settings.y_dst)
			.closest('.control-group').hide();
		},
		
		init: function() {
			$('#' + settings.container)
			.css({ minHeight: '600px' });
			
			state.mapLoc = new Samaranch.MapLoc({
				container: settings.container,
				starter_image: null,
				touch_action: function(x, y){
					$('#' + settings.x_dst).val(x);
					$('#' + settings.y_dst).val(y);
					
					state.mapLoc.clearMarkers();
					state.mapLoc.touch(x, y);
				}
			});
			
			priv.setupTriggers();
			priv.hideXY();
			priv.getMap();
		}
		
	};
	
	var pub = {
		init: priv.init
	};
	
	pub.init();
	
	return pub;
	
};