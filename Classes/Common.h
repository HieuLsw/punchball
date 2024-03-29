/*
 Copyright 2009 Kurt Daal
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#define D_PI 6.28318530717959f

#define H_PI 1.570796327f

inline float normAngle(float a) {
	return fmodf(a + D_PI, D_PI);
}

inline float halfAngle(float a) {
	return fmodf(a + D_PI, M_PI);
}