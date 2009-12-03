#define D_PI 6.28318530717959f

#define H_PI 1.570796327f

inline float normAngle(float a) {
	return fmodf(a + D_PI, D_PI);
}

inline float halfAngle(float a) {
	return fmodf(a + D_PI, M_PI);
}