package;
import djWeb.Page;


/**
 * Global Page parameters
 * ----------------------
 * Static class for global access
 */

// Make all fields public, avoid writing "public static var" every time
@:publicFields
class REG
{
	// -- SIZES
	// ------------------------------------
	// The minimum width the page can dynamically be set to
	static var MIN_WIDTH:Int = 600;
	// The maximum width the page can dynamically be set to
	static var MAX_WIDTH:Int = 1300;
	// The default width of the elements
	static var DEF_WIDTH:Int = 800;
	
	// -- PATHS
	// ------------------------------------
	static var PATH_MEDIA = "media/";
	
	// -- TITLES
	// ------------------------------------
	static var SITE_TITLE = "John32b Works";
	static var HEADER_TITLE = "John32b";
	static var HEADER_SUBTITLE = "programming, graphics, tools, games";
	
	// -- OTHER
	// ------------------------------------
	static var TILED_BACKGROUNDS = ["bg1.png", "bg2.png", "bg3.png"];
	// --
	static var ICON_BLOG = "ic_blog.png";
	static var ICON_TWITTER = "ic_twitter.png";
	static var ICON_TUMBLR = "ic_tumblr.png";
	static var ICON_GITHUB = "ic_github.png";
	static var ICON_EMAIL = "ic_email.png";
	static var ICON_WARN = "ic_warning.png";
	// --
	static var LINK_TWITTER_HANDLE = 'john32b';
	static var LINK_TWITTER = "https://www.twitter.com/" + LINK_TWITTER_HANDLE;
	
	static var LINK_BLOG = null;
	
	static var LINK_TUMBLR = "https://john32b.tumblr.com";
	static var LINK_GITHUB = "https://github.com/john32b/john32b.github.io";
	static var LINK_EMAIL = "john32b@outlook.com"; 
	
	// -- Global colors and Styles
	// -----------------------
	static var COLOR_ACCENT = "yellow";
	static var COLOR_ACCENT_2 = "#DDC564";  	// Used in entries
	
	static var COLOR_LINK = "#EFE305"; 		// Default <a> links
	static var COLOR_LINK_HOVER = "orange"; 	// 
	
	static var COLOR_MOB_THEME = "#2D2D2D";
	
	// -- Other
	// ----------------------------------
	// NEW: Uses new djWeb 0.3.0
	static var VERSION = "0.9.5";
	
}// --