package flexItems;

import djWeb.W;
import djWeb.ScrollAware;
import djWeb.media.BoxWebm;

import js.Browser;
import js.html.Element;
import js.html.Image;
import js.html.VideoElement;


/**
 * Visual representation of 'DataEntry' as a box
 * Video, Title, Description
 */
class Box_Entry
{	
	// The main element
	public var el(default,null):Element;

	// -- Elements:
	// Pointer to the webm box, if present
	var video:BoxWebm = null;
	
	// The two main parts of the box, thumb and text infos
	var DIV_THUMB:Element;
	var DIV_INFO:Element;
	
	// I need to know when the vidoes come on screen so that I can automatically stop/play
	public var scrollAware:ScrollAware = null;
		
	// -- Hard Coded Parameters
	// -------------------------------------
	
	// NOTE:
	// The width of the box is the value of REG.MIN_WIDTH
	
	static var SIZE_FOOTER:String = "8px";
	static var SIZE_TEXT:String = "14px";
	
	static var COLOR_TITLE:String = "white";
	static var COLOR_TEXT:String = "#555";
	static var COLOR_FOOTER:String = "#444";
	
	// Applies to all sides for both thumb and info boxes
	// The space between those is halfed
	static var PADDING:Int = 12;
	
	// Where are the images and webms for the project entries
	static var PROJECT_MEDIA:String = REG.PATH_MEDIA + "projects/";
	
	// Force the thumb to a 4/3 aspect ratio
	static var THUMB_WIDTH:Int = 202; // 208
	static var THUMB_HEIGHT:Int = Std.int(THUMB_WIDTH / (4 / 3)); // Auto generated
	//---------------------------------------------------;
	
	public function new(data:DataEntry) 
	{
		// -- Create the container
		el = W.dom.newElement("div");
		
		if (W.browser.IS_MOBILE)
		{
			el.style.margin = "6px 0px 0px 0px";
			el.style.minHeight = "{$THUMB_HEIGHT}px";
			el.style.backgroundColor = "black";
			el.style.display = "flex";
			el.style.alignItems = "center"; // was stretch
			//el.style.minWidth = REG.MIN_WIDTH + "px";
			el.style.width = REG.MIN_WIDTH + "px";
			el.style.padding = '${PADDING}px ${PADDING/2}px ${PADDING/2}px ${PADDING/2}px';	
			el.style.flexDirection = "column";
			
		}else
		{
			el.style.margin = "0px 8px 8px 8px";
			//el.style.minHeight = "{$THUMB_HEIGHT}px";
			el.style.backgroundColor = "black";
			el.style.display = "flex";
			el.style.flexDirection = "row";	
			el.style.alignItems = "center"; // was stretch
			el.style.minWidth = REG.MIN_WIDTH + "px";
			el.style.width = REG.MIN_WIDTH + "px";
			el.style.padding = '${PADDING}px ${PADDING/2}px ${PADDING/2}px ${PADDING/2}px';	
		}

		// - Left Box, containing image and footer
		// -----------------------------------------
		DIV_THUMB = W.dom.newElement('div');
		DIV_THUMB.style.padding = '0 ${PADDING/2}px 0 ${PADDING/2}px';
		W.dom.toFlex(DIV_THUMB, "column");

		// If it's a video, set a video element
		// If it's an image, set an image element
		var THUMB:Element;
		
		if (data.video != null) {
			video = new BoxWebm(PROJECT_MEDIA + data.video, THUMB_WIDTH, THUMB_HEIGHT);
			THUMB = video.el;
		}else
		{
			var img:Image = new Image(THUMB_WIDTH, THUMB_HEIGHT);
			if (data.thumb == null) data.thumb = "ph.jpg"; // Placeholder image
			img.src = PROJECT_MEDIA + data.thumb;
			img.style.objectFit = "cover";
			THUMB = cast img;			
		}
		
		THUMB.style.border = "1px solid #222";
		THUMB.style.transition = "border 0.2s ease-out";
		
		// - Date and Language
		var FOOTER = W.dom.newElement('span');
			FOOTER.style.fontSize = SIZE_FOOTER;
			FOOTER.style.color = COLOR_FOOTER;
			FOOTER.style.marginTop = "4px";
			FOOTER.innerText = '${data.year} , ' + data.lang.toUpperCase();
		
		
		// - Right Box, containing Title and description
		// ----------------------------------------------
		
		DIV_INFO = W.dom.newElement('div');
		DIV_INFO.style.padding = '0 ${PADDING/2}px 0 ${PADDING/2}px';

		var STRIPCON = W.dom.newElement('div');
			STRIPCON.style.display = "flex";
			STRIPCON.style.alignItems = "flex-end";
			
		var STRIP = W.dom.newElement('div');
			STRIP.style.position = "absolute";
			STRIP.style.background = REG.COLOR_ACCENT;
			STRIP.style.transition = "width 0.2s ease-out";
			STRIP.style.width = "0px";
			STRIP.style.height = "";
		
		// - Title
		var TITLE = W.dom.newElement('h2');
			TITLE.style.flex = "3";
			TITLE.style.padding = "2px";
			TITLE.style.position = "relative";
			TITLE.style.fontWeight = "bold";
			TITLE.style.color = COLOR_TITLE;
			TITLE.innerText = data.title;
			TITLE.style.transition = "color 0.2s ease-out";

		
		// - Project type
		var SUBTITLE = W.dom.newElement('span');
			SUBTITLE.style.flex = "1";
			SUBTITLE.style.position = "relative";
			SUBTITLE.style.textAlign = "right";
			SUBTITLE.style.fontSize = SIZE_FOOTER;
			SUBTITLE.style.color = REG.COLOR_ACCENT_2;
			SUBTITLE.innerText = data.type;
			

		// - The description text
		var DESC = W.dom.newElement('p');
			DESC.style.borderTop = "2px solid " + REG.COLOR_ACCENT_2;
			DESC.style.paddingTop = "4px";
			DESC.style.fontSize = SIZE_TEXT;
			DESC.style.color = COLOR_TEXT;
			DESC.innerText = data.desc;
			
		// --  Add everything to the element
		W.dom.qAppend(DIV_THUMB, [ W.dom.toLink(THUMB, data.url ), FOOTER]);
		W.dom.qAppend(STRIPCON, [STRIP, TITLE, SUBTITLE]);
		W.dom.qAppend(DIV_INFO, [STRIPCON, DESC]);
		W.dom.qAppend(el, [DIV_THUMB, DIV_INFO]);
		
		THUMB.onmouseover = function(_) {
			THUMB.style.border = "1px solid yellow";
		};
		THUMB.onmouseout = function(_) {
			THUMB.style.border = "1px solid #222";
		};
		
		// Only webkit seems to support this effect		
		// --
		if (W.browser.IS_WEBKIT)
		{
			el.onmouseover = function(_) {
				
				// I need to set the height of the strip, because it was 0.
				// Also this should be done only once
				if (STRIP.style.height == "")
					STRIP.style.height = TITLE.offsetHeight + "px";
					
				STRIP.style.width = TITLE.offsetWidth + "px";
				TITLE.style.color = "black";
			}; // --
			
			el.onmouseout = function(_) {
				STRIP.style.width = "0px";
				TITLE.style.color = COLOR_TITLE;
			}; //--
			
		}// - end webkit
		
		// -- ScrollAware
		if (video != null)
		{
			scrollAware = new ScrollAware(el);
			scrollAware.trigger_offset = 32;
			scrollAware.callback_ON = function(){
				video.play();
			};
			scrollAware.callback_OFF = function(){
				video.pause();
			};
		}
		
	}//---------------------------------------------------;
	
	// --
	// Place the thumb on the left of the box
	public function thumbLeft()
	{
		el.style.flexDirection = "row";
	}//---------------------------------------------------;
	
	// --
	// Place the thumb on the right of the box
	public function thumbRight()
	{
		el.style.flexDirection = "row-reverse";
	}//---------------------------------------------------;
	
	
}// --