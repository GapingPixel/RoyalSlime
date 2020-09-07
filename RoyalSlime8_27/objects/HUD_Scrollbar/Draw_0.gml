/// @description Draw self
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

var _offscroll = clamp(button_y, padding, bar_height - padding);
draw_sprite(Slime_SlimeUI_Scroll, 0, x, y + _offscroll);