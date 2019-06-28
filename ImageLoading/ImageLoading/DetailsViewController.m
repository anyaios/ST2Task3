//
//  DetailsViewController.m
//  ImagesLoading
//
//  Created by Anna Ershova on 6/17/19.
//  Copyright © 2019 Anna Ershova. All rights reserved.
//

#import "DetailsViewController.h"
#import "MainTableViewController.h"

@interface DetailsViewController ()
@property (strong, nonatomic) UIImageView *detailsView;
@end

@implementation DetailsViewController
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (id)init
{
    self = [super init];
    if (!self)
        return nil;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(getImageLoadingNotification:)
                                                 name:@"GetImageLoadingNotification"
                                               object:nil];
    
    return self;
}

- (void)getImageLoadingNotification:(NSNotification *) notification
{
    NSLog (@"Notification: Image has been loaded!");
    NSDictionary *userInfo = notification.userInfo;
    //    dispatch_async(dispatch_get_main_queue(), ^{
    self.detailsView.image = [userInfo objectForKey:@"NotificationImageKey"];
    //    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Details";
    
    _detailsView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    if (_detailsImage.size.width > self.view.bounds.size.width || _detailsImage.size.height > self.view.bounds.size.height) {
        _detailsView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        _detailsView.image = _detailsImage;
        
        
    }
    else {
        _detailsView.image = _detailsImage;
        
    }
    _detailsView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view reloadInputViews];
    [self.view addSubview:_detailsView];
    
    
    
}



@end
