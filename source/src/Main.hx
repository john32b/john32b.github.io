package;

import djWeb.media.BoxWebm;
import djWeb.other.BgTileScroller;
import djWeb.tools.BrowserInfos;
import djWeb.tools.Helper;
import djWeb.MainFrame;
import djWeb.Page;
import djWeb.Section;
import djWeb.W;
import djWeb.Loader;
import djWeb.MainFrame;
import djWeb.other.FixedHeader;

import sections.*;


/**
 * Simple one page showcasing my various works
 * Uses the djWeb library, a Haxe Library for creating simple pages with just code
 */
class Main extends MainFrame
{
	
	// --
	// Initialize and preload
	public function new() 
	{
		//- Call super constructor with custom parameters
		super({
			scrollable:true,		// Allow the page to be scrolled vertically
			scrollEvents:true,		// Push scroll events to objects
			pageTitle:REG.SITE_TITLE
		}); 

		// --
		createStyles();
		
		// -- Initialize some classes
		BoxWebm.DEFAULTS.spinner = REG.PATH_MEDIA + "loading2.gif";
		
		// -- I need to call this
		W.browser.videoCheck();
		
		// PRELOAD ::
		// Preload files that I need to have before creating the page :
		W.loader.addJSON('bin/entries.json', 'entries'); // Get later with W.loader.bank.get('entries');
		for (i in REG.TILED_BACKGROUNDS) W.loader.addImage(REG.PATH_MEDIA + i);
		W.loader.start(ready); // call ready() when done

	}//---------------------------------------------------;
	
	
	// --
	public function ready()
	{
		// -- Add a gradient background
		bg.style.background = "linear-gradient(to bottom, #000 0%, #333 100%)";
		
		// -- Experimenting with a dynamic header ??
		var h:FixedHeader = new FixedHeader( { autoHide:true, height:18, scrollTrigger:100 } );
			h.el.style.background = REG.COLOR_ACCENT;
			h.el.appendChild(W.text.fText(params.pageTitle, { size:12, color:'black' } ));
			addHeader(h);
			
		
		// -- Create the main page
		var p = new Page("main");

			// -- Deco Strip
			p.add(new Section({height:'8px', width:'100%', backgroundColor:REG.COLOR_ACCENT}));
		
			p.add(new Section_Title());
			
			// Incompatible browsers warning ::
			if (!W.browser.VIDEO_WEBM) 
			{
				p.add(new Section_Incompatible());
			}
		
			p.add(new Section_Header("Projects", "Showcase of various works", REG.MAX_WIDTH - 64));
			p.add(new Section_Projects());
			p.add(new Section_Header("More", "Links and Contact Info", REG.DEF_WIDTH + 64));
			p.add(new Section_Other());
			p.add(new Section_Footer());
			
		// --
				
		addPage(p, true);
		
	}//---------------------------------------------------;
	
	// --
	function createStyles()
	{
		// -- 
		if (W.browser.IS_MOBILE)
		{
			REG.MIN_WIDTH = width;	// MainFrame.width is the page full width
			REG.DEF_WIDTH = width;
			REG.MAX_WIDTH = width;
			
			// -- Works on android, paint the adress bar
			W.dom.ADD_META('theme-color', REG.COLOR_MOB_THEME);
		}
		
		// Test the styles raw on index.html, and then transfer them here manually :-/
		var css:String = '';
			css += 'a { text-decoration:none; color:${REG.COLOR_LINK}; } a:hover {color:${REG.COLOR_LINK_HOVER};}';
			css += 'h1,h2,h3,h4 { font-weight:bold; }';
			css += 'h2 { font-size: 22px; }';
			css += 'h3 { font-size: 16px; font-weight:100; }';
			css += 'h4 { font-size: 8px;  }';
			// css += 'em { font-style: normal; color:#666 }'; // Used in footer links
		
		W.dom.CSS_AddStyle("custom", css);

		// -- Alter the section class default width 
		Section.defStyle.width = REG.DEF_WIDTH + "px";
	}//---------------------------------------------------;
	
	
	// -- Copy Paste this function --
	static function main() {
		js.Browser.document.body.onload = function() {
			new Main();
		}
	}//---------------------------------------------------;	
	
}