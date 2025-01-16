integer DISPLAY_CLEAR = 0;
integer DISPLAY_TEXT  = 1;

string test1 =
	"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer ti";

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
		test();
	}
}