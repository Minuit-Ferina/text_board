#pragma once

#ifdef DEBUG
#define LOG(x)	   llOwnerSay("LOG: " + __FILE__ + "(" + (string)__LINE__ + ")" + (string)x)
#define WARNING(x) llSay(DEBUG_CHANNEL, "WARNING: " + __FILE__ + "(" + (string)__LINE__ + ")" + (string)x)
#else
// #warning "NODEBUG"
#define LOG(x)
#define WARNING(x)
#endif

#define ERROR(x) llSay(DEBUG_CHANNEL, "ERROR: " + __FILE__ + "(" + (string)__LINE__ + ")" + (string)x)