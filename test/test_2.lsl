integer DISPLAY_CLEAR = 0;
integer DISPLAY_TEXT  = 1;

string test1		  = "Lorem ipsum dolor sit amet, consectetuer adipisc";

test()
{
	llMessageLinked(LINK_SET, DISPLAY_CLEAR, "", NULL_KEY);
	llMessageLinked(LINK_SET, DISPLAY_TEXT, test1, NULL_KEY);
}
default
{
	state_entry()
	{
		test();
	}

	touch_end(integer num_detected)
	{
		test()
	}
}