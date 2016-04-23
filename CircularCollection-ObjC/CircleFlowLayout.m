//
//  CircleFlowLayout.m
//  CircularCollection-ObjC
//
//  Created by Shana Joyner on 4/21/16.
//  Copyright © 2016 Mind Activation Code. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.



#import "CircleFlowLayout.h"

#define SIZE_FOR_ITEM 75.0

@implementation CircleFlowLayout

- (void) prepareLayout {
    [super prepareLayout];
    
    CGSize size = self.collectionView.frame.size;
    numberOfItems = [self.collectionView numberOfItemsInSection:0];
    centerPoint = CGPointMake(size.width / 2.0f, size.height / 2.5f);
    radius = MIN(size.width, size.height) / 2.75f;
    
    // add Welcome label at the center
    
    middleLabel = [[UILabel alloc] initWithFrame:CGRectMake((size.width/2)-100, (size.height/2.5)-25, 200.0, 50.0)];
    middleLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    middleLabel.textAlignment = NSTextAlignmentCenter;
    middleLabel.font = [UIFont boldSystemFontOfSize:30.0];
    middleLabel.backgroundColor = [UIColor clearColor];
    middleLabel.textColor = [UIColor whiteColor];
    middleLabel.text = @"Welcome";
    
    [self.collectionView addSubview:middleLabel];
    
}

- (CGSize) collectionViewContentSize {
    
    return self.collectionView.frame.size;
    
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat progress = (float)indexPath.item / (float)numberOfItems;
    CGFloat theta = 2.0f * M_PI * progress;
    CGFloat xPosition = centerPoint.x + radius * cos(theta);
    CGFloat yPosition = centerPoint.y + radius * sin(theta);
    attributes.size = CGSizeMake(SIZE_FOR_ITEM, SIZE_FOR_ITEM);
    attributes.center = CGPointMake(xPosition, yPosition);
    
    return attributes;
    
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributes = [NSMutableArray array];
    for (NSInteger index = 0; index < numberOfItems; index++){
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    
    return attributes;
    
}

@end
