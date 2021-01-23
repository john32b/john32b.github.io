package sections;

import djWeb.W;
import djWeb.tools.BrowserInfos;
import djWeb.Section;


// - General purpose
// - Small section to display [ TITLE , SUBTITLE ]
// --
class Section_Header extends Section
{

	var COLOR_H:String = "#AAA";
	var COLOR_L:String = "#555";
	
	/**
	 * Predefined styled Section with Title, Subtitle
	 * @param	text Main Title
	 * @param	subtitle Sub Title
	 * @param	maxW if > 0 allow to resize over the default width
	 */
	public function new(text:String, subtitle:String = "", maxW:Int = -1)
	{
		
		super( { marginTop:'8px', marginBottom:'8px'});
		
		setResizeBehavior('rubber', [REG.MIN_WIDTH, maxW > 0?maxW:REG.DEF_WIDTH]);
		
		W.dom.toFlex(el, "row","start", "center");
		
		
		var TITLE = W.dom.newElement('h3');
			TITLE.style.display = "inline";
			TITLE.style.padding = "4px";
			TITLE.style.backgroundColor = COLOR_L;
			TITLE.style.color = COLOR_H;
			TITLE.innerText = text;
		
		var SUBT = W.dom.newElement('p');
			SUBT.style.display = "inline";
			SUBT.style.color = COLOR_L;
			SUBT.style.paddingLeft = "8px";
			SUBT.style.fontSize = "8px";
			SUBT.innerText = subtitle;
			
		if (W.browser.IS_MOBILE)
		{
			SUBT.style.fontSize = "12px";
			SUBT.style.paddingLeft = "8px";
		}
			
		W.dom.qAppend(el, [TITLE, SUBT]);
	}//---------------------------------------------------;
	
}// --