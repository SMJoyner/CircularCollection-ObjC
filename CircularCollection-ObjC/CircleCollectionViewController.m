//
//  CircleCollectionViewController.m
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


#import "CircleCollectionViewController.h"
#import "CircleCollectionViewCell.h"
#import "CircleFlowLayout.h"
#import "DetailViewController.h"

@interface CircleCollectionViewController ()

@end

@implementation CircleCollectionViewController

@synthesize circleMenu, menuNames, namesDesc, imageView;


static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    //CircleFlowLayout *circleLayout = [[CircleFlowLayout alloc]init];
    //self.collectionViewLayout = circleLayout;

    
    // Register cell classes
    [self.collectionView registerClass:[CircleCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageNamed:@"cherrywoodgrain"];
    self.imageView = [[UIImageView alloc]initWithImage:image];
    self.collectionView.backgroundView = self.imageView;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CircleCellData" ofType:@"plist"];
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.circleMenu = dictionary;
    NSArray *array = [self.circleMenu allKeys];
    NSArray *sortedArray = [array sortedArrayUsingSelector:@selector(compare:)];
    self.menuNames = sortedArray;
    
    self.collectionView.allowsSelection = YES;
    self.collectionView.allowsMultipleSelection = NO;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.menuNames count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CircleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    NSString *displayName = [self.menuNames objectAtIndex:indexPath.item];
    cell.titleLabel.text = displayName;
    
    return cell;
}


#pragma mark <UICollectionViewDelegate>


// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}



// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //Destination View
    DetailViewController *detailViewController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    //Object(s) to pass
    NSString *selectedMenuName = [self.menuNames objectAtIndex:indexPath.item];
    NSString *selectedNameDescr = [self.circleMenu objectForKey:selectedMenuName];
    detailViewController.currentMenuName = selectedMenuName;
    detailViewController.currentNameDescr = selectedNameDescr;
    
    [self.navigationController pushViewController:detailViewController animated:NO];
    
    //[self performSegueWithIdentifier:@"showDetail" sender:self];
    
}


/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
