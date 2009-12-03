#import "HitEffect.h"


@implementation HitEffect

-(id) initWithPlayerColor: (int)_color
{
	if( !(self=[super initWithTotalParticles:30]) )
		return nil;
	
	// duration
	duration = kParticleDurationInfinity;
	
	// gravity
	gravity.x = 0;
	gravity.y = 0;
	
	// angle
	angle = 90;
	angleVar = 360;
	
	// speed of particles
	speed = 150;
	speedVar = 10;
	
	// radial
	//radialAccel = -60;
	//radialAccelVar = 30;
	radialAccel = 0;
	radialAccelVar = 0;
	
	// tagential
	//tangentialAccel = 15;
	//tangentialAccelVar = 10;
	tangentialAccel = 0;
	tangentialAccelVar = 0;
	
	// emitter position
	self.position = ccp(160, 240);
	posVar = CGPointZero;
	
	// life of particles
	life = 0.8;
	lifeVar = 0.2;
	
	// size, in pixels
	startSize = 5.0f;
	startSizeVar = 0.0f;
	endSize = kParticleStartSizeEqualToEndSize;
	
	// emits per second
	emissionRate = totalParticles/life;
	
	// color of particles
	
	/*
	if (_color == 0) {
		endColor.r = startColor.r = 0.78f;
		endColor.g = startColor.g = 0.45f;
		endColor.b = startColor.b = 0.24f;
	} if (_color == 1) {
		endColor.r = startColor.r = 0.23f;
		endColor.g = startColor.g = 0.78f;
		endColor.b = startColor.b = 0.23f;
	} if (_color == 2) {
		endColor.r = startColor.r = 0.75f;
		endColor.g = startColor.g = 0.75f;
		endColor.b = startColor.b = 0.22f;
	} if (_color == 3) {
		endColor.r = startColor.r = 0.25f;
		endColor.g = startColor.g = 0.22f;
		endColor.b = startColor.b = 0.75f;
	}
	*/
	
	endColor.r = startColor.r = 0.9f;
	endColor.g = startColor.g = 0.9f;
	endColor.b = startColor.b = 0.9f;
	
	//TODO... other colors
	startColor.a = 1.0f;
	startColorVar.r = 0.0f;
	startColorVar.g = 0.0f;
	startColorVar.b = 0.0f;
	startColorVar.a = 0.0f;
	
	endColor.a = 0.0f;
	endColorVar.r = 0.0f;
	endColorVar.g = 0.0f;
	endColorVar.b = 0.0f;
	endColorVar.a = 0.0f;
	
	//self.texture = [[TextureMgr sharedTextureMgr] addImage: @"fire.png"];
	self.texture = [[TextureMgr sharedTextureMgr] addImage: @"flake.png"];
	
	// additive
	//blendAdditive = YES;
	blendAdditive = NO;
	
	[self stopSystem];
	
	return self;
}



-(void)activate 
{
	active = YES;
}



-(void) step: (ccTime) dt
{
	if( active && emissionRate ) {
		float rate = 1.0f / emissionRate;
		emitCounter += dt;
		while( particleCount < totalParticles && emitCounter > rate ) {
			[self addParticle];
			emitCounter -= rate;
		}
		
		elapsed += dt;
		if(duration != -1 && duration < elapsed)
			[self stopSystem];
	}
	
	particleIdx = 0;
	
	// test performance with [self absolutePosition];
	//	CGPoint	absolutePosition = [self convertToWorldSpace:CGPointZero];
	CGPoint	absolutePosition = position_;
	
	while( particleIdx < particleCount )
	{
		Particle *p = &particles[particleIdx];
		
		if( p->life > 0 ) {
			
			CGPoint tmp;;//, radial, tangential;
			
			/*
			radial = CGPointZero;
			// radial acceleration
			if(p->pos.x || p->pos.y)
				radial = ccpNormalize(p->pos);
			tangential = radial;
			radial = ccpMult(radial, p->radialAccel);
			
			// tangential acceleration
			float newy = tangential.x;
			tangential.x = -tangential.y;
			tangential.y = newy;
			tangential = ccpMult(tangential, p->tangentialAccel);
			
			// (gravity + radial + tangential) * dt
			tmp = ccpAdd( ccpAdd( radial, tangential), gravity);
			tmp = ccpMult( tmp, dt);
			p->dir = ccpAdd( p->dir, tmp);
			*/
			tmp = ccpMult(p->dir, dt);
			p->pos = ccpAdd( p->pos, tmp );
			
			/*
			p->color.r += (p->deltaColor.r * dt);
			p->color.g += (p->deltaColor.g * dt);
			p->color.b += (p->deltaColor.b * dt);
			p->color.a += (p->deltaColor.a * dt);
			
			p->size += (p->deltaSize * dt);
			*/
			
			p->life -= dt;
			
			//
			// update values in point
			//
			CGPoint	newPos = p->pos;
			if( positionType_ == kPositionTypeFree ) {
				newPos = ccpSub(absolutePosition, p->startPos);
				newPos = ccpSub( p->pos, newPos);
			}
			
			// place vertices and colos in array
			vertices[particleIdx].pos = newPos;
			vertices[particleIdx].size = p->size;
			vertices[particleIdx].colors = p->color;
			
			// update particle counter
			particleIdx++;
			
		} else {
			// life < 0
			if( particleIdx != particleCount-1 )
				particles[particleIdx] = particles[particleCount-1];
			particleCount--;
			
			if( particleCount == 0 && autoRemoveOnFinish_ ) {
				[self unschedule:@selector(step:)];
				[[self parent] removeChild:self cleanup:YES];
			}
		}
	}
	glBindBuffer(GL_ARRAY_BUFFER, verticesID);
	glBufferData(GL_ARRAY_BUFFER, sizeof(ccPointSprite)*particleCount, vertices,GL_DYNAMIC_DRAW);
	glBindBuffer(GL_ARRAY_BUFFER, 0);
}

@end
