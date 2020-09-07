/// @description Insert description here
// You can write your code in this editor
event_inherited();

topLimit = y - (sprite_height/2) + (image_xscale*16);
bottomLimit = y + (sprite_height/2) - (image_xscale*17);


a = instance_create_layer(x, y, "Instances", o_scroll);
a.image_xscale = image_xscale;
a.image_yscale = image_yscale;
a.barLength = sprite_height;
a.topLimit = topLimit;
a.bottomLimit = bottomLimit;
a.y = topLimit;
a.depth = depth - 1;