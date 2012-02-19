// This should be requested with a params object containing:
// container - the container of the map area

Samaranch.MapLoc = function(params) {
	
	var settings = {
		container: null,
		starter_image: null,
		touch_action: function(x, y){
			priv.drawImage();
			priv.marker(x, y);
		}
	};
	
	var state = {
		ctx: null,
		c_width: 0,
		c_height: 0,
		img: null,
		img_src: null,
		markers: []
	};
	
	settings = Samaranch.setupParams(settings, params, {
		container: {
			type: Samaranch.Validator.COMPULSORY,
			title: 'Map Container'
		}
	});
	
	$('#' + settings.container).addClass('venue-map-loc-active');
	
	var priv = {
		
		buildCanvas: function() {
			var canv_id = settings.container + '--canvas';
			
			$('canvas', '#' + settings.container).remove();
			
			$('#' + settings.container)
			.css({ position: 'relative' });
			
			var canv = $('<canvas />', {
				id: canv_id
			})
			.css({ position: 'absolute', top: '0', left: '0', zIndex: 10 });
			
			$('#' + settings.container).append(canv);
			
			state.ctx = $('#' + canv_id)
						.get(0).getContext('2d');
			
			$('#' + canv_id).mouseup(function(e) {
				var x = e.offsetX,
				y = e.offsetY;
				
				settings.touch_action(x, y);
			});
		},
		
		drawMap: function(map) {
			if (!!map) {
				state.img_src = map;
				priv.drawImage(0, 0, state.img_src, {
					pre: function(img) {
						state.c_width = img.width;
						state.c_height = img.height;
						
						$('#' + settings.container + '--canvas')
						.attr('width', state.c_width)
						.attr('height', state.c_height);
					},
					
					post: function(img) {
						_.each(state.markers, function(m){
							priv.marker(m);
						});
					}
				});
			}
		},
		
		clear: function() {
			state.ctx.clearRect(0, 0, state.c_width, state.c_height);
		},
		
		line: function(x1, y1, x2, y2) {
			state.ctx.beginPath();
			state.ctx.moveTo(x1, y1);
			state.ctx.lineTo(x2, y2);
			state.ctx.stroke();
		},
		
		marker: function(marker) {
			x = +(marker.x), y = +(marker.y);
			
			if (!!marker.img) {
				if (!!marker.xOff) x -= +(marker.xOff);
				if (!!marker.yOff) y -= +(marker.yOff);
				
				priv.drawImage(x, y, marker.img);
			}
			else {			
				var ms = 10; // marker size
				
				state.ctx.strokeStyle = "rgba(255,255,255,0.5)";
				state.ctx.lineWidth = (ms/2);
				
				priv.line(x-ms, y-ms, x+ms, y+ms);
				priv.line(x-ms, y+ms, x+ms, y-ms);
				
				state.ctx.strokeStyle = "rgba(180,0,0,1)";
				state.ctx.lineWidth = (ms/2) - 2;
				
				var ins = ms - 1;
				
				priv.line(x-ins, y-ins, x+ins, y+ins);
				priv.line(x-ins, y+ins, x+ins, y-ins);
			}
		},
		
		drawImage: function(x, y, img_url, callbacks) {
			var cb = {
				pre: function(img){},
				post: function(img){}
			};
			cb = _.extend(cb, callbacks);
			
			x = +(x), y = +(y);
			
			if (!!img_url) {
				var img = $('<img />', {
					src: img_url
				});
				
				img.load(function() {
					if (_.isFunction(cb.pre)) {
						var pre = cb.pre(this);
					}
					
					state.ctx.drawImage(this, x, y);
					
					if (_.isFunction(cb.post)) {
						var post = cb.post(this);
					}
				});
			}
		},
		
		init: function() {
			priv.buildCanvas();
			priv.drawMap(settings.starter_image);
		}
		
	};
	
	var pub = {
		init: priv.init,
		
		changeImage: function(img_url) {
			priv.drawMap(img_url);
		},
		
		touch: function(x, y) {
			pub.addMarker(x, y);
		},
		
		addMarker: function(x, y, img, xOff, yOff) {
			var marker = { x: x, y: y };
			if (!!img) marker['img'] = img;
			if (!!xOff) marker['xOff'] = xOff;
			if (!!yOff) marker['yOff'] = xOff;
			
			state.markers.push(marker);
			priv.drawMap(state.img_src);
		},
		
		clearMarkers: function() {
			state.markers = [];
			priv.drawMap(state.img_src);
		}
	};
	
	pub.init();
	
	return pub;
	
};