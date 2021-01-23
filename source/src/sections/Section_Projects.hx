package sections;

import djWeb.W;
import djWeb.Section;
import flexItems.Box_Entry;
import js.html.Element;

class Section_Projects extends Section
{
	// Hold the data for the elements
	var entries:Array<DataEntry>;
	
	// Hold the box elements
	var boxes:Array<Box_Entry>;

	//---------------------------------------------------;
	// --
	public function new() 
	{
		name = "Project Section";
		
		// Apply the default style, but alter some things
		super({
			padding:'0',
		});
		
		// -- Rubber means that it will stretch from min to max
		setResizeBehavior('steps', [REG.MIN_WIDTH, 1250]);
	
		// -- Preloaded earlier, contents of 'entries.json'
		entries = W.loader.bank.get("entries").entries;
		
		// --
		W.dom.toFlex(el, "row", "center");

	}//---------------------------------------------------;

	/**
	 * I am doing this here because I need to call
	 * page.trackScroll() which just became available
	 */
	override public function onAddedToPage() 
	{
		// -- Read the data anc add boxes
		boxes = [];

		for (i in entries)
		{ 
			var b = new Box_Entry(i);
			boxes.push(b);
			add(b);
			page.trackScroll(b.scrollAware);
		}
		
	}//---------------------------------------------------;
	
	// -- Autocalled on resize
	override public function onStepResize(step:Int) 
	{
		if (W.browser.IS_MOBILE) return;
		
		if (step == 0){
			narrow();
		}else{
			wide();
		}
	}//---------------------------------------------------;
	
	// --
	// Alternate the style in the boxes, left and right
	public function narrow()
	{
		var counter = 0;
		for (b in boxes) {
			if (counter++ % 2 == 0) {
				b.thumbLeft();
			}else {
				b.thumbRight();
			}
		}
	}//---------------------------------------------------;
	
	// --
	// All boxes to style left
	public function wide()
	{
		for (b in boxes) {
			b.thumbLeft();
		}
	}//---------------------------------------------------;
	
}// -- //