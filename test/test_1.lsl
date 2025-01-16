integer DISPLAY_CLEAR = 0;
integer DISPLAY_TEXT  = 1;

default
{
	state_entry()
	{
		llMessageLinked(LINK_SET, DISPLAY_CLEAR, "", NULL_KEY);
		llMessageLinked(LINK_SET, DISPLAY_TEXT, "Hello World!", NULL_KEY);
	}
}