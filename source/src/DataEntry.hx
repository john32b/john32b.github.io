package;

/**
 * Typedef for the project data read from 'entries.json'
 */
typedef DataEntry =
{
	var title:String;
	var desc:String;
	var type:String;	// e.g. open source lib, video game
	var lang:String;	// e.g. Haxe, flash
	var url:String;		// Link to go to see the full project page
	var year:String;	// 
	var video:String;  // optional webm, if present it will be loaded
	var thumb:String;  // optional image, if not preset, a placeholder will be used
};