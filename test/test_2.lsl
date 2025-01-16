integer DISPLAY_CLEAR = 0;
integer DISPLAY_TEXT  = 1;

string test1		  = "Lorem ipsum dolor sit amet, consectetuer adipisc";

default
{
	state_entry()
	{
		llMessageLinked(LINK_SET, DISPLAY_CLEAR, "", NULL_KEY);
		llMessageLinked(LINK_SET, DISPLAY_TEXT, test1, NULL_KEY);
	}
}