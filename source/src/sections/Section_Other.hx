package sections;

import djWeb.W;
import djWeb.Section;
import js.html.Element;
import js.html.Image;
import js.html.ImageElement;

/**
 * Contact info and other links
 */
class Section_Other extends Section
{
	// Text color
	var COLOR = "#BBB";
	var COLOR1 = "#CCC";
	// --
	var IMG_WIDTH = 26;
	var IMG_HEIGHT = 26;
	
	var FONT = "monospace"; // default // "Helvetica";
	
	//---------------------------------------------------;
	
	// --
	public function new() 
	{
		// --
		super({padding:"8px 10px 8px 10px", backgroundColor:"#222"});
		
		// -- Text for Links
		W.text.addStyle('text', {
			font:FONT,
			size:12,
			bold:'500',
			color:COLOR
		});
		
		// -- Text for Text before Links
		W.text.addStyle('textH', {
			font:FONT,
			size:14,
			bold:'300',
			color:COLOR1,
			padding:"2px 32px 10px 32px"
		});
		
		
		setResizeBehavior("rubber", [REG.MIN_WIDTH, REG.DEF_WIDTH]);
		
		add(W.text.sText('A simple page showcasing some of the projects I have worked on. The entire page was build with javascript code, compiled with HAXE.', 'textH'));
		
		add(toLink(REG.ICON_TUMBLR, 
			"Visit my %Tumblr% page to see some of my graphics related work", REG.LINK_TUMBLR));			
			
		add(toLink(REG.ICON_GITHUB, 
			"Checkout the repository with source of this page at %Github%", REG.LINK_GITHUB));
				
		add(toLink(REG.ICON_TWITTER, 
			"Follow me on Twitter %" + '@${REG.LINK_TWITTER_HANDLE}%' , REG.LINK_TWITTER));
			
		add(toLink(REG.ICON_EMAIL, 
			"Send me an e-mail %" + '${REG.LINK_EMAIL}%', "mailto:" + REG.LINK_EMAIL));
		
	}//---------------------------------------------------;
	
	/**
	 * Return a section specific styled Link
	 * [ICON] , TEXT : url inside the text and ICON
	 * @param	img Must be inside the MEDIA folder
	 * @param	txt You can set a word to be a link by enclosing it with '%' // %link%
	 * @param	url
	 */
	function toLink(imgSrc:String, txt:String, url:String)
	{
		// Replace %--% with actual link tags
		txt = ~/%(.+)%/.replace(txt, '<a href="$url">$1</a>');
		
		var div = W.dom.newFlex("row", "center", "flex-end");
			div.style.marginLeft = "32px";

		var img:Image = new Image(IMG_WIDTH, IMG_HEIGHT);
			img.src = REG.PATH_MEDIA + imgSrc;
			img.style.marginBottom = "-6px"; // Bring it a bit to the bottom
			
		var p = W.text.sText(txt, 'text');
			p.style.flex = "1"; // This will make it fill rest of the line.
			p.style.padding = "0px 0px 0px 4px";
			
		W.dom.qAppend(div, [W.dom.toLink(img, url) , p]);
		return div;
	}//---------------------------------------------------;
	
}// --