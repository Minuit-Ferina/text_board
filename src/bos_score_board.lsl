#include "PrimLinkFinder.lsl"
#include "SetLinkTextureFast.lsl"

integer DISPLAY_CLEAR = 0;
integer DISPLAY_TEXT = 1;

string test1 = "Lorem ipsum dolor sit amet, consectetuer adipisc";
string test2 =
	"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo "
	"ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis "
	"dis parturient montes, nascetur ridiculus mus. Donec quam felis, "
	"ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa "
	"quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, "
	"arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. "
	"Nullam dictum felis eu pede mollis pretium. Integer ti";

key texture1 = "dd965aa4-b63e-a8d3-5ea7-f493f962d99c";
key texture2 = "6cbc5a4f-8297-7f10-801d-823519ac0bef";

log(string str)
{
	// llSay(0, str);
	llRegionSayTo("997addb8-a08d-4b3d-9135-915556abfdc4", 0, str);
}

integer getLinkNum(integer line, integer row)
{
	string link_name = "l" + (string)line + " s" + (string)row;
	integer link	 = getLinkWithName(link_name);
	// log("link_name: " + link_name);
	// log("link: " + (string)link);
	return getLinkWithName(link_name);
}

/*
" " : <-0.45000, 0.45000, 0>
"z" : <-0.45000, -0.45000, 0>
"3" : <0.45000, 0.34999, 0>
"5" : <-0.34999, 0.25001, 0>
*/
vector char_to_offset(string char)
{
	integer ord = llOrd(char, 0) - 32;
	// log("ord: " + (string)ord);
	float x = -0.45 + (ord % 10) / 10.;
	float y = 0.45 - llFloor(ord / 10.) / 10.;
	// log("vec: " + (string) < x, y, 0 >);
	return <x, y, 0>;
}

displayBuff(string buff)
{
	integer n	 = llStringLength(buff);
	integer c	 = 0;
	integer line = 0;
	integer row	 = 0;
	integer face = 0;
	for(; c < n; c++)
	{

		face = c % 8;
		row	 = llFloor(c / 8) % 6;
		line = llFloor(c / 48);

		if(c >= 480)
			return;

		integer link  = getLinkNum(line, row);

		vector offset = char_to_offset(llGetSubString(buff, c, c));
		llSetLinkPrimitiveParamsFast(link, [PRIM_TEXTURE, face, texture1, <0.09, 0.09, 0.0>, offset, 0.0]);
	}
}

clearDisplay()
{
	integer line = 0;
	for(; line < 10; line++)
	{
		integer row = 0;
		for(; row < 6; row++)
		{
			integer link = getLinkNum(line, row);
			llSetLinkPrimitiveParamsFast(link, [PRIM_TEXTURE, ALL_SIDES , texture1, <0.09, 0.09, 0.0>, <-0.45, 0.45, 0>, 0.0]);
		}
	}
}

default
{
	state_entry()
	{
		clearDisplay();
		displayBuff("Crystie is the best :)");
	}

	link_message(integer sender_num, integer num, string str, key id)
	{
		if(num == DISPLAY_CLEAR)
			clearDisplay();
		else if(num == DISPLAY_TEXT)
			displayBuff(str);
	}
}
