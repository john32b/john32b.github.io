package sections;

import djWeb.W;
import djWeb.Section;
import js.html.Element;
import js.html.Image;
import js.html.ImageElement;

// --
class Section_Incompatible extends Section
{
	var BG_COLOR_RED:String = "#E1390F";
	var BG_COLOR_YELLOW:String = "#FAA505";
	
	// Text color
	var TEXT_COLOR:String = "#DDD";
	var TEXT_SIZE:String = "16px";
	
	// --
	var IMG_WIDTH:Int = 26;
	var IMG_HEIGHT:Int = 26;
	
	//---------------------------------------------------;
	// --
	public function new() 
	{
		super();
		
		el.style.display = "flex";
		el.style.alignItems = "center";
		el.style.padding = "16px";
		
	
		var img:Image = new Image(IMG_WIDTH, IMG_HEIGHT);
			img.src = REG.PATH_MEDIA + REG.ICON_WARN;
		
		add(img);
		
		var p:Element = W.dom.newElement("p");
			p.style.fontSize = TEXT_SIZE;
			p.style.color = TEXT_COLOR;
			p.style.marginLeft = "12px";
			
		add(p);
	
		if (!W.browser.VIDEO_WEBM)
		{
			p.innerHTML = "Browser doesn't support WEBM videos.<br/>Please use FIREFOX for the full experience";
			p.style.color = BG_COLOR_YELLOW;
		}
		
		 // Close button
		 
		var close = W.text.cText("X", "link");
			close.style.padding = "2px 2px 2px 32px";
			close.style.cursor = "pointer";
			close.onclick = function(_) {
				el.parentNode.removeChild(el);
			};

		 add(close);
	}//---------------------------------------------------;
	
}// --