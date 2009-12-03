#define D_PI 6.28318530717959f

float normAngle(float a) {
	return fmodf(a + D_PI, D_PI);
}

float halfAngle(float a) {
	return fmodf(a + D_PI, M_PI);
}