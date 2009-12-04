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

#import "cocos2d.h"
#import "chipmunk.h"

@class Player;

@interface PunchAction : Action {
	Player *player;
	cpSpace* space;
	cpVect dir;
	bool isRetreating;
	bool isHit;
	float elapsed;
	float duration;
	float power;
	float punchTime;
}

@property (readwrite) cpVect dir;
@property (readwrite) bool isHit;
@property (readwrite) float power;

- (id) initWithPlayer:(Player*)_player space:(cpSpace*)_space;
- (void) reset;
- (void) retreat;

@end
