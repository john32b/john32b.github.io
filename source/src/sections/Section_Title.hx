package sections;

import djWeb.W;
import djWeb.Section;
import djWeb.other.AutoText;
import djWeb.other.BgTileScroller;
import djWeb.tools.Helper;

import js.html.Element;
import js.html.Image;
import js.html.LinkElement;
import js.html.SpeechRecognition;

/**
 */
class Section_Title extends Section
{
	// -- Link icons
	static var ICON_WIDTH:Int = 42;
	static var ICON_HEIGHT:Int = 42;
	//====================================================;
	
	public function new()
	{
		name = "Title Section";
		
		// Apply the default style, but alter some things
		super({
			height:'240px',
			padding:'8px'
		}); 
		
		// -- Rubber means that it will stretch from min to max
		setResizeBehavior('rubber', [REG.MIN_WIDTH, REG.DEF_WIDTH]);
	
		// -- 
		createBGStrip();
		
		// Get an image at random to use as a tiled background
		BgTileScroller.linkElement(bg, REG.PATH_MEDIA + REG.TILED_BACKGROUNDS[Std.random(REG.TILED_BACKGROUNDS.length)]);
		
		// --
		W.dom.toFlex(el, "column");
		
		// -- Create two containers
		var TOP = W.dom.newElement('div');
			TOP.style.flex = "1";
			
		var BOTTOM = W.dom.newElement('div');
			BOTTOM.style.display = "flex";
			BOTTOM.style.justifyContent = "flex-end";
		
		var title  = W.dom.newElement("h1");
			title.style.color = REG.COLOR_ACCENT;
			title.innerText = REG.HEADER_TITLE;

		var subTitle = W.dom.newElement("h3");
			subTitle.style.color = "#DDD";
			subTitle.innerText = REG.HEADER_SUBTITLE;
		
		W.dom.qAppend(TOP, [title, subTitle]);
		W.dom.qAppend(el, [TOP, BOTTOM]);

		BOTTOM.appendChild(getLink(REG.ICON_TWITTER, "Twitter", REG.LINK_TWITTER));
		BOTTOM.appendChild(getLink(REG.ICON_TUMBLR, "Tumblr", REG.LINK_TUMBLR));
		if (REG.LINK_BLOG != null)
		BOTTOM.appendChild(getLink(REG.ICON_BLOG, "Blog", REG.LINK_BLOG));
		
		// -- Autotext 
		var at:AutoTextGroup = new AutoTextGroup([title, subTitle], 100);
			at.start();
	}//---------------------------------------------------;
	
	
	/**
	 * GET:
	 * DIV( [ image ] text ) ==> Dom element
	 */
	function getLink(imageSource:String, text:String, url:String):Element
	{
		var container:Element = W.dom.newElement("div");
			container.style.display = "flex";
			container.style.alignItems = "flex-end";
			container.style.marginRight = "8px";
		var im:Image = new Image(ICON_WIDTH, ICON_HEIGHT);
			im.src = REG.PATH_MEDIA + imageSource;
			im.style.objectFit = "cover";
		var txt:LinkElement = cast W.dom.newElement("a");
			txt.onmouseover = function(e:Dynamic) {
				txt.style.color = REG.COLOR_ACCENT;
				im.style.paddingBottom = '4px';
			};
			txt.onmouseleave = function(e:Dynamic) {
				txt.style.color = "white";
				im.style.paddingBottom = '0';
			}
			txt.href = url;
			txt.innerText = text;
			txt.style.fontSize = "12px";
			txt.style.color = "white";
			txt.style.paddingBottom = "8px";
			
		W.dom.qAppend(container, [W.dom.toLink(im, url, false), txt]);
		
		return container;
	}//---------------------------------------------------;
	
	
}// -- //