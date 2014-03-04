//
//  Copyright (c) 2014, Jesse Collis
//  All rights reserved.
//

#import "JCFloat.h"

typedef union 
{
  int32_t i;
  float f;
  struct
  {
    uint32_t mantissa : 23;
    uint32_t exponent : 8;
    uint32_t sign : 1;
  } parts;
} Float_t;


BOOL JCFloatIsEqual(const float A, const float B)
{
  NSCAssert(sizeof(float) == sizeof(int32_t), @"The size of float and int32_t is inconsistent.");

  if (A - B == 0.0f) return YES;
  
  Float_t a, b;
  a.f = A;
  b.f = B;

  if (a.parts.sign != b.parts.sign)
  {
    return NO;
  }

  const int maxUlps = 1;  // For a normal float number a maxUlps (Units in the Last Place) of 1 is equivalent to a maxRelativeError of between 1/8,000,000 and 1/16,000,000

  int intDiff = abs(a.i - b.i);

  if (intDiff <= maxUlps)
  {
    return YES; 
  }

  return NO;
}
