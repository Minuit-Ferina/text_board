#include "PrimLinkFinder.lsl"
#include "SetLinkTextureFast.lsl"

integer DISPLAY_CLEAR = 0;
integer DISPLAY_TEXT  = 1;

key texture1		  = "dd965aa4-b63e-a8d3-5ea7-f493f962d99c";
key texture2		  = "6cbc5a4f-8297-7f10-801d-823519ac0bef";

list lookup_index_to_link;

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
	float x		= -0.45 + (ord % 10) / 10.;
	float y		= 0.45 - llFloor(ord / 10.) / 10.;
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

		integer link  = llList2Integer(lookup_index_to_link, c);
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
			llSetLinkPrimitiveParamsFast(link, [PRIM_TEXTURE, ALL_SIDES, texture1, <0.09, 0.09, 0.0>, <-0.45, 0.45, 0>, 0.0]);
		}
	}
}

init()
{
	llSay(0, "Initializing the board");
	// build a lookup list for index -> linknumber
	integer c = 0;
	integer n = 480;
	for(; c < n; c++)
	{
		integer row	 = llFloor(c / 8) % 6;
		integer line = llFloor(c / 48);

		integer link = getLinkNum(line, row);
		lookup_index_to_link += link;
	}
	llSay(0, "Board ready");
}

default
{
	state_entry()
	{
		init();
		clearDisplay();
	}

	link_message(integer sender_num, integer num, string str, key id)
	{
		if(num == DISPLAY_CLEAR)
			clearDisplay();
		else if(num == DISPLAY_TEXT)
			displayBuff(str);
	}
}
