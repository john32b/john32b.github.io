package sections;

import djWeb.W;
import djWeb.Section;
import djWeb.tools.Helper;
import js.html.Element;

/*
 * This Section can use the CSS's <em> style 
 */
class Section_Footer extends Section
{
	var COLOR_1= "#444";
	var COLOR_2 = "#666";
	var FONT = null;// "Helvetica";
	
	//====================================================;
	
	public function new() 
	{
		initStyle();
		
		super({marginTop:'16px', paddingBottom:'4px', paddingTop:'4px' });
		
		// --
		createBGStrip("black");
		bg.style.borderBottom = "1px solid #333";
		
		// Lines of the footer text
		var str:Array<String> = [];
		
		str[0] = 
			"Made with " + getEmLink("HAXE", "http://haxe.org") +
			", John32b 2016-2021";
			
		// --
		for (s in str) add( W.text.fText(s, {size:8, color:COLOR_1, align:"center", font:FONT, bold:'400'} ));
	}//---------------------------------------------------;

	
	static var _stylesAdded:Bool = false;
	static function initStyle()
	{
		if (_stylesAdded) return;
			_stylesAdded = true;
		
		var LINK_COLOR = "#707070";
		var LINK_COLOR_H = "#C0C0C0";
		var css = '.flink { color:$LINK_COLOR; } .flink:hover {color:$LINK_COLOR_H;}';
		
		W.dom.CSS_AddStyle('flink', css);
		
	}//---------------------------------------------------;
		
	
	// --
	function getEmLink(text:String, url:String):String
	{
		return '<a href="$url" class="flink">$text</a>';
	}//---------------------------------------------------;
	
}// -- //