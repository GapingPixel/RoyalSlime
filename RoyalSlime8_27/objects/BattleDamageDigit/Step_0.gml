/// @description Handle gravity and increment time_alive counter
time_alive++;

if (buffer_time > 0) {
	buffer_time--;
	exit;
}

if (zsp < digit_grav_cap)
	zsp += digit_grav_accel;
else
	zsp = digit_grav_cap;

if (z_pos >= 0 && zsp >= 0) {
	z_pos = 0;
	zsp = 0;
}

z_pos += zsp;

if (time_alive >= lifetime)
	instance_destroy();