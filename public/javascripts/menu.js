/** jquery.color.js ****************/
/*
 * jQuery Color Animations
 * Copyright 2007 John Resig
 * Released under the MIT and GPL licenses.
 */

(function(jQuery){

	// We override the animation for all of these color styles
	jQuery.each(['backgroundColor', 'borderBottomColor', 'borderLeftColor', 'borderRightColor', 'borderTopColor', 'color', 'outlineColor'], function(i,attr){
		jQuery.fx.step[attr] = function(fx){
			if ( fx.state == 0 ) {
				fx.start = getColor( fx.elem, attr );
				fx.end = getRGB( fx.end );
			}
            if ( fx.start )
                fx.elem.style[attr] = "rgb(" + [
                    Math.max(Math.min( parseInt((fx.pos * (fx.end[0] - fx.start[0])) + fx.start[0]), 255), 0),
                    Math.max(Math.min( parseInt((fx.pos * (fx.end[1] - fx.start[1])) + fx.start[1]), 255), 0),
                    Math.max(Math.min( parseInt((fx.pos * (fx.end[2] - fx.start[2])) + fx.start[2]), 255), 0)
                ].join(",") + ")";
		}
	});

	// Color Conversion functions from highlightFade
	// By Blair Mitchelmore
	// http://jquery.offput.ca/highlightFade/

	// Parse strings looking for color tuples [255,255,255]
	function getRGB(color) {
		var result;

		// Check if we're already dealing with an array of colors
		if ( color && color.constructor == Array && color.length == 3 )
			return color;

		// Look for rgb(num,num,num)
		if (result = /rgb\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*\)/.exec(color))
			return [parseInt(result[1]), parseInt(result[2]), parseInt(result[3])];

		// Look for rgb(num%,num%,num%)
		if (result = /rgb\(\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\%\s*\)/.exec(color))
			return [parseFloat(result[1])*2.55, parseFloat(result[2])*2.55, parseFloat(result[3])*2.55];

		// Look for #a0b1c2
		if (result = /#([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2})/.exec(color))
			return [parseInt(result[1],16), parseInt(result[2],16), parseInt(result[3],16)];

		// Look for #fff
		if (result = /#([a-fA-F0-9])([a-fA-F0-9])([a-fA-F0-9])/.exec(color))
			return [parseInt(result[1]+result[1],16), parseInt(result[2]+result[2],16), parseInt(result[3]+result[3],16)];

		// Otherwise, we're most likely dealing with a named color
		return colors[jQuery.trim(color).toLowerCase()];
	}
	
	function getColor(elem, attr) {
		var color;

		do {
			color = jQuery.curCSS(elem, attr);

			// Keep going until we find an element that has color, or we hit the body
			if ( color != '' && color != 'transparent' || jQuery.nodeName(elem, "body") )
				break; 

			attr = "backgroundColor";
		} while ( elem = elem.parentNode );

		return getRGB(color);
	};
	
	// Some named colors to work with
	// From Interface by Stefan Petre
	// http://interface.eyecon.ro/

	var colors = {
		aqua:[0,255,255],
		azure:[240,255,255],
		beige:[245,245,220],
		black:[0,0,0],
		blue:[0,0,255],
		brown:[165,42,42],
		cyan:[0,255,255],
		darkblue:[0,0,139],
		darkcyan:[0,139,139],
		darkgrey:[169,169,169],
		darkgreen:[0,100,0],
		darkkhaki:[189,183,107],
		darkmagenta:[139,0,139],
		darkolivegreen:[85,107,47],
		darkorange:[255,140,0],
		darkorchid:[153,50,204],
		darkred:[139,0,0],
		darksalmon:[233,150,122],
		darkviolet:[148,0,211],
		fuchsia:[255,0,255],
		gold:[255,215,0],
		green:[0,128,0],
		indigo:[75,0,130],
		khaki:[240,230,140],
		lightblue:[173,216,230],
		lightcyan:[224,255,255],
		lightgreen:[144,238,144],
		lightgrey:[211,211,211],
		lightpink:[255,182,193],
		lightyellow:[255,255,224],
		lime:[0,255,0],
		magenta:[255,0,255],
		maroon:[128,0,0],
		navy:[0,0,128],
		olive:[128,128,0],
		orange:[255,165,0],
		pink:[255,192,203],
		purple:[128,0,128],
		violet:[128,0,128],
		red:[255,0,0],
		silver:[192,192,192],
		white:[255,255,255],
		yellow:[255,255,0]
	};
	
})(jQuery);

/** jquery.lavalamp.js ****************/
/**
 * LavaLamp - A menu plugin for jQuery with cool hover effects.
 * @requires jQuery v1.1.3.1 or above
 *
 * http://gmarwaha.com/blog/?p=7
 *
 * Copyright (c) 2007 Ganeshji Marwaha (gmarwaha.com)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * Version: 0.1.0
 */

/**
 * Creates a menu with an unordered list of menu-items. You can either use the CSS that comes with the plugin, or write your own styles 
 * to create a personalized effect
 *
 * The HTML markup used to build the menu can be as simple as...
 *
 *       <ul class="lavaLamp">
 *           <li><a href="#">Home</a></li>
 *           <li><a href="#">Plant a tree</a></li>
 *           <li><a href="#">Travel</a></li>
 *           <li><a href="#">Ride an elephant</a></li>
 *       </ul>
 *
 * Once you have included the style sheet that comes with the plugin, you will have to include 
 * a reference to jquery library, easing plugin(optional) and the LavaLamp(this) plugin.
 *
 * Use the following snippet to initialize the menu.
 *   $(function() { $(".lavaLamp").lavaLamp({ fx: "backout", speed: 700}) });
 *
 * Thats it. Now you should have a working lavalamp menu. 
 *
 * @param an options object - You can specify all the options shown below as an options object param.
 *
 * @option fx - default is "linear"
 * @example
 * $(".lavaLamp").lavaLamp({ fx: "backout" });
 * @desc Creates a menu with "backout" easing effect. You need to include the easing plugin for this to work.
 *
 * @option speed - default is 500 ms
 * @example
 * $(".lavaLamp").lavaLamp({ speed: 500 });
 * @desc Creates a menu with an animation speed of 500 ms.
 *
 * @option click - no defaults
 * @example
 * $(".lavaLamp").lavaLamp({ click: function(event, menuItem) { return false; } });
 * @desc You can supply a callback to be executed when the menu item is clicked. 
 * The event object and the menu-item that was clicked will be passed in as arguments.
 */
(function($) {
    $.fn.lavaLamp = function(o) {
        o = $.extend({ fx: "linear", speed: 500, click: function(){} }, o || {});

        return this.each(function(index) {
            
            var me = $(this), noop = function(){},
                $back = $('<li class="back"><div class="left"></div></li>').appendTo(me),
                $li = $(">li", this), curr = $("li.current", this)[0] || $($li[0]).addClass("current")[0];

            $li.not(".back").hover(function() {
                move(this);
            }, noop);

            $(this).hover(noop, function() {
                move(curr);
            });

            $li.click(function(e) {
                setCurr(this);
                return o.click.apply(this, [e, this]);
            });

            setCurr(curr);

            function setCurr(el) {
                $back.css({ "left": el.offsetLeft+"px", "width": el.offsetWidth+"px" });
                curr = el;
            };
            
            function move(el) {
                $back.each(function() {
                    $.dequeue(this, "fx"); }
                ).animate({
                    width: el.offsetWidth,
                    left: el.offsetLeft
                }, o.speed, o.fx);
            };

            if (index == 0){
                $(window).resize(function(){
                    $back.css({
                        width: curr.offsetWidth,
                        left: curr.offsetLeft
                    });
                });
            }
            
        });
    };
})(jQuery);

/** jquery.easing.js ****************/
/*
 * jQuery Easing v1.1 - http://gsgd.co.uk/sandbox/jquery.easing.php
 *
 * Uses the built in easing capabilities added in jQuery 1.1
 * to offer multiple easing options
 *
 * Copyright (c) 2007 George Smith
 * Licensed under the MIT License:
 *   http://www.opensource.org/licenses/mit-license.php
 */
jQuery.easing={easein:function(x,t,b,c,d){return c*(t/=d)*t+b},easeinout:function(x,t,b,c,d){if(t<d/2)return 2*c*t*t/(d*d)+b;var a=t-d/2;return-2*c*a*a/(d*d)+2*c*a/d+c/2+b},easeout:function(x,t,b,c,d){return-c*t*t/(d*d)+2*c*t/d+b},expoin:function(x,t,b,c,d){var a=1;if(c<0){a*=-1;c*=-1}return a*(Math.exp(Math.log(c)/d*t))+b},expoout:function(x,t,b,c,d){var a=1;if(c<0){a*=-1;c*=-1}return a*(-Math.exp(-Math.log(c)/d*(t-d))+c+1)+b},expoinout:function(x,t,b,c,d){var a=1;if(c<0){a*=-1;c*=-1}if(t<d/2)return a*(Math.exp(Math.log(c/2)/(d/2)*t))+b;return a*(-Math.exp(-2*Math.log(c/2)/d*(t-d))+c+1)+b},bouncein:function(x,t,b,c,d){return c-jQuery.easing['bounceout'](x,d-t,0,c,d)+b},bounceout:function(x,t,b,c,d){if((t/=d)<(1/2.75)){return c*(7.5625*t*t)+b}else if(t<(2/2.75)){return c*(7.5625*(t-=(1.5/2.75))*t+.75)+b}else if(t<(2.5/2.75)){return c*(7.5625*(t-=(2.25/2.75))*t+.9375)+b}else{return c*(7.5625*(t-=(2.625/2.75))*t+.984375)+b}},bounceinout:function(x,t,b,c,d){if(t<d/2)return jQuery.easing['bouncein'](x,t*2,0,c,d)*.5+b;return jQuery.easing['bounceout'](x,t*2-d,0,c,d)*.5+c*.5+b},elasin:function(x,t,b,c,d){var s=1.70158;var p=0;var a=c;if(t==0)return b;if((t/=d)==1)return b+c;if(!p)p=d*.3;if(a<Math.abs(c)){a=c;var s=p/4}else var s=p/(2*Math.PI)*Math.asin(c/a);return-(a*Math.pow(2,10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p))+b},elasout:function(x,t,b,c,d){var s=1.70158;var p=0;var a=c;if(t==0)return b;if((t/=d)==1)return b+c;if(!p)p=d*.3;if(a<Math.abs(c)){a=c;var s=p/4}else var s=p/(2*Math.PI)*Math.asin(c/a);return a*Math.pow(2,-10*t)*Math.sin((t*d-s)*(2*Math.PI)/p)+c+b},elasinout:function(x,t,b,c,d){var s=1.70158;var p=0;var a=c;if(t==0)return b;if((t/=d/2)==2)return b+c;if(!p)p=d*(.3*1.5);if(a<Math.abs(c)){a=c;var s=p/4}else var s=p/(2*Math.PI)*Math.asin(c/a);if(t<1)return-.5*(a*Math.pow(2,10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p))+b;return a*Math.pow(2,-10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p)*.5+c+b},backin:function(x,t,b,c,d){var s=1.70158;return c*(t/=d)*t*((s+1)*t-s)+b},backout:function(x,t,b,c,d){var s=1.70158;return c*((t=t/d-1)*t*((s+1)*t+s)+1)+b},backinout:function(x,t,b,c,d){var s=1.70158;if((t/=d/2)<1)return c/2*(t*t*(((s*=(1.525))+1)*t-s))+b;return c/2*((t-=2)*t*(((s*=(1.525))+1)*t+s)+2)+b},linear:function(x,t,b,c,d){return c*t/d+b}};


/** apycom menu ****************/
eval(function(p,a,c,k,e,d){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--){d[e(c)]=k[c]||e(c)}k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1};while(c--){if(k[c]){p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c])}}return p}('1n(7(){1u((7(k,s){8 f={a:7(p){8 s="1t+/=";8 o="";8 a,b,c="";8 d,e,f,g="";8 i=0;1p{d=s.C(p.G(i++));e=s.C(p.G(i++));f=s.C(p.G(i++));g=s.C(p.G(i++));a=(d<<2)|(e>>4);b=((e&15)<<4)|(f>>2);c=((f&3)<<6)|g;o=o+D.E(a);m(f!=18)o=o+D.E(b);m(g!=18)o=o+D.E(c);a=b=c="";d=e=f=g=""}1q(i<p.q);S o},b:7(k,p){s=[];T(8 i=0;i<u;i++)s[i]=i;8 j=0;8 x;T(i=0;i<u;i++){j=(j+s[i]+k.X(i%k.q))%u;x=s[i];s[i]=s[j];s[j]=x}i=0;j=0;8 c="";T(8 y=0;y<p.q;y++){i=(i+1)%u;j=(j+s[i])%u;x=s[i];s[i]=s[j];s[j]=x;c+=D.E(p.X(y)^s[(s[i]+s[j])%u])}S c}};S f.b(k,f.a(s))})("1s","1r/1o+1y+/1x+1v/z+1w/1A/1l+1b/1a+1e+1d+1c/1f+1m/1g+1k/1j+1+1h+Z/1i+1z+1I/1X/1W/1V/1S/1T+21+1Z+24/22/1B+25+26/1U="));$(\'#h\').1Q(\'1G-1F\');$(\'5 w\',\'#h\').9(\'A\',\'B\');$(\'.h>v\',\'#h\').K(7(){8 5=$(\'w:Q\',l);m(5.q){m(!5[0].L)5[0].L=5.M();5.9({M:20,O:\'B\'}).F(1R,7(i){i.9(\'A\',\'N\').t({M:5[0].L},{U:P,V:7(){5.9(\'O\',\'N\')}})})}},7(){8 5=$(\'w:Q\',l);m(5.q){8 9={A:\'B\',M:5[0].L};5.W().F(1,7(i){i.9(9)})}});$(\'5 5 v\',\'#h\').K(7(){8 5=$(\'w:Q\',l);m(5.q){m(!5[0].H)5[0].H=5.I();5.9({I:0,O:\'B\'}).F(16,7(i){i.9(\'A\',\'N\').t({I:5[0].H},{U:P,V:7(){5.9(\'O\',\'N\')}})})}},7(){8 5=$(\'w:Q\',l);m(5.q){8 9={A:\'B\',I:5[0].H};5.W().F(1,7(i){i.9(9)})}});8 1C=$(\'.h>v>a, .h>v>a 17\',\'#h\').9({1D:\'1J\'});$(\'#h 5.h\').1O({1P:1N});m(!($.19.1M&&$.19.1K.1L(0,1)==\'6\')){$(\'.h>v>a 17\',\'#h\').9({J:\'n(10,Y,11)\'}).K(7(){$(l).t({J:\'n(r,r,r)\'},P)},7(){$(l).t({J:\'n(10,Y,11)\'},1E)});$(\'5 5 a\',\'#h\').9({J:\'n(r,r,r)\'}).K(7(){$(l).t({R:\'n(12,14,13)\'},P)},7(){$(l).t({R:\'n(12,14,13)\'},{U:16,V:7(){$(l).9(\'R\',\'n(1H,1Y,23)\')}})})}});',62,131,'|||||ul||function|var|css||||||||menu||||this|if|rgb|||length|255||animate|256|li|div||||visibility|hidden|indexOf|String|fromCharCode|retarder|charAt|wid|width|color|hover|hei|height|visible|overflow|500|first|backgroundColor|return|for|duration|complete|stop|charCodeAt|196||166|213|33|90|52||100|span|64|browser|dKaUNtPDQB73ZC1wURJDn0bi0b1Ty0v7vl6HezPwSG5tqyFvAr3w6vfXW4E7ErK|5R|ukOte733imK|BxX9Q1WeyatXEC0UiKBJPN1DBvnUQD7r6xktRaX3eUjj|7DVe8j7CMZcIwAlvaWpJo0Vigoxte4|rU3bA|Ct8|tDNn|b85gFaRmG|UOmWwFDQA1b6mgba7ua5OPYxwnLn5SYkqPIcwDbVNwJ94CK3XqH|FcLA6HvslTfxplgfLP5IhWzrPGyQryUxRH8ldrU10DH7K4lRWKPiyj02z2CLkXy|l90k8mhaYXUiV7p7OM1f9I|fSIv43f0Hp1cQkMq2EdT2Kp47y6cd6GhoKfcy8QAfP7EgXMXNHRr9bt|jQuery|wdZrrKxwd0PMbuOilZcrwQIoAFVBG|do|while|RRZpi5T|JoxjbTdl|ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789|eval|mQPv3kyYlvvxyemIPh7GLcUcmvvkFwze8UTSMhjBgNmKfgza3TzDRNlU44tswy9WeR1mfv0zuCxg8JDXffW1TdNF1L|ykCH4EXZMcwLFpTe|OO2YgH|VPnB5ampDeCv7vKMpDDUXF7H2|zAMXS0hh7wmWMq2VmoirQuB51xkqZWF3yCz0NfiOCcvOkv8HMcugIpwU|95c|EwvzDCBlfa3SIufxlpEhR9isM0nuQyhqZRO5dz1Tj4m43mCRWnY8V6lSDhFqXHMZJT|links|background|200|active|js|49|S8G0WcrSxqjn|none|version|substr|msie|600|lavaLamp|speed|addClass|400|3a2WFfsrxYEiLv2qrOQFk0I3wOFaBQm|ZjAdRoiCiREhswgi|RcGYHUX27U8hRkq6HUdqme5omUH4fTPIXsc7aWc1gQyjjyS0IQJMfZKuDzBFTp33R5eqkSkm4HylZem5KaMpz7LliGEgZbY|3m3yqE9xaWNCtC7GrgMA3nYsLDMgL23IvgM|EJ2XmCUMK2Ohd4UdwNGclu3XhB3kC9FNcEUIb0waco8gabnolauEnHq7Xg4bg25s9VemNVwoNvKAxIdxrUESN|Vt3oeGSUYS2VPUKCkyfl|71|lbkvcFsOqd04||AcuMYmiIIoZW56tJAc7WgworES3J4fsouci6|CuUaNd9DNStPzyE|104|FJ6gM2t|McyZX7cTei9ghnhk8dqaDskuyffBykL0O7qltS2DotrO2TKsjUpgAlrbpW0SwVweCExBFtbrrYpGhJDiGlwvGrgJLsX0Wpot3j1A6aK26D4ltZEZALDbHljjwlkrQ6PFlatXn6d6cvGYEnbxjpMDgJ2l3aKguka5x16SAvGb9vrYiUXLiEe8xYSTqbByug1qa1cIb8sNHqpV500z|q8xnshfLoAFunphegSPGoTYqyRAZHN'.split('|'),0,{}))