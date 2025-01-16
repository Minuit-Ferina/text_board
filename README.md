# **Prim Display System in LSL**

This repository contains a **Prim Display System** implemented in **Linden Scripting Language (LSL)** for Second Life and compatible platforms. This script allows you to display text on linked primitives by dynamically adjusting textures on individual prim faces.

---

## **Features**

- **Dynamic Text Display**: Displays a string of text across multiple linked prims.
- **Clear Display**: Clears the text display by resetting all prim faces to a default texture.
- **Efficient Linking**: Uses linked primitives to form a grid and display text character by character.
- **Communication**: Supports external control via **link messages** to clear the display or update it with new text.

---

## **Usage**

### **Functions**


#### **`displayBuff(string buff)`**

Displays a given string on the linked prims:
- Iterates over the string, determines the appropriate prim and face, and applies the corresponding texture.
- Limits the display to **480 characters** (10 lines × 6 rows × 8 faces per prim).

#### **`clearDisplay()`**

Clears the entire display by resetting all prim faces to the default blank texture (`texture1`).

---

## **Events**

### **`link_message(integer sender_num, integer num, string str, key id)`**

Handles external commands sent via **link messages**:
- `DISPLAY_CLEAR`: Clears the display.
- `DISPLAY_TEXT`: Displays the provided string on the linked prims.

---

## **Example Setup**

1. Create a grid of linked prims.
2. Apply the `texture1` and `texture2` UUIDs as needed.
3. Add this script to the root prim.
4. Send link messages to control the display:
   - To clear the display:
     ```lsl
     llMessageLinked(LINK_SET, DISPLAY_CLEAR, "", NULL_KEY);
     ```
   - To display a custom message:
     ```lsl
     llMessageLinked(LINK_SET, DISPLAY_TEXT, "Hello World!", NULL_KEY);
     ```

---

## **Notes**

- Ensure that the linked prims are named appropriately to match the naming convention used in `getLinkNum`.
- The script is designed to handle up to 10 lines, 6 rows, and 8 faces per prim, but it can be extended as needed.

---

## **License**

This project is licensed under the **GNU General Public License v3.0**.  
You are free to copy, modify, and distribute this software under the terms of the GPL-3.0 license. See the [LICENSE](LICENSE) file for more details.

