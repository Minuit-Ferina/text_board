integer DISPLAY_CLEAR = 0;
integer DISPLAY_TEXT  = 1;

test()
{
	llMessageLinked(LINK_SET, DISPLAY_CLEAR, "", NULL_KEY);
	llMessageLinked(LINK_SET, DISPLAY_TEXT, "Hello World!", NULL_KEY);
}

default
{
	state_entry()
	{
		test();
	}

	touch_end(integer num_detected)
	{
		test();
	}
}