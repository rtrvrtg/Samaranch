// This should be requested with a params object containing:
// container - the container of the map area
// x_dst - the ID of the X coordinate field
// y_dst - the ID of the Y coordinate field

Samaranch.LocationMarkerLoc = function(params) {
	
	var settings = {
		container: null,
		x_dst: null,
		y_dst: null
	};
	
	var state = {
		mapLoc: null
	};
	
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
		}
	});
	
	$('#' + settings.container).addClass('venue-map-display-active');
	
	var priv = {
		
		drawMarkers: function() {
			var mapId = $('#' + settings.container).attr('data-mapid');
			
			var x = $('#' + settings.x_dst).val(),
			y = $('#' + settings.y_dst).val();
			
			if (!!x && !!y) {
				state.mapLoc.touch(x, y);
			}
		},
		
		init: function() {
			$('img', '#' + settings.container).load(function(){
				state.mapLoc = new Samaranch.MapLoc({
					container: settings.container,
					starter_image: $(this).attr('src'),
					touch_action: function(x, y){
						$('#' + settings.x_dst).val(x);
						$('#' + settings.y_dst).val(y);
						
						state.mapLoc.clearMarkers();
						state.mapLoc.touch(x, y);
					}
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