//
//  MainTableViewController.m
//  ImagesLoading
//
//  Created by Anna Ershova on 6/16/19.
//  Copyright © 2019 Anna Ershova. All rights reserved.
//

#import "MainTableViewController.h"
#import "DetailsViewController.h"


@interface MainTableViewController () <UIGestureRecognizerDelegate>
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSArray<NSURL*> *imagesURLArray;


@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imagesURLArray = @[
                        [NSURL URLWithString:@"https://c1.hiqcdn.com/destreviewimages/1486539360_rotates_shareiq_31544_1486461457.063237.jpg"],
                        [NSURL URLWithString:@"https://scontent-frx5-1.cdninstagram.com/vp/efd59409b2bac83c1ad378fe542f39f0/5D80F33E/t51.2885-15/e35/51209147_350241069161826_7334232745829333021_n.jpg?_nc_ht=scontent-frx5-1.cdninstagram.com"],
                        [NSURL URLWithString: @"https://pbs.twimg.com/profile_images/378800000198640344/ba708dc064f537216aad5dc6717cf1bd.png"],
                        [NSURL URLWithString: @"https://www.wweek.com/resizer/_DDVSRW-9D8QxpWF7m1epefQi-U=/1200x0/filters:quality(100)/s3.amazonaws.com/arc-wordpress-client-uploads/wweek/wp-content/uploads/2018/02/05191110/cats_web.jpg"],
                        [NSURL URLWithString:@"https://vignette.wikia.nocookie.net/disney/images/e/e3/Profile_-_Dipper_Pines.png/revision/latest?cb=20190318192148"],
                        [NSURL URLWithString:@"https://resizing.flixster.com/4EPyfvw507unm0L8c8-jTom7H_0=/300x300/v1.bjsyMDA3ODEyO2o7MTgxMTM7MTIwMDsxMzY2Ozc2OA"],
                        [NSURL URLWithString:@"https://resizing.flixster.com/4EPyfvw507unm0L8c8-jTom7H_0=/300x300/v1.bjsyMDA3ODEyO2o7MTgxMTM7MTIwMDsxMzY2Ozc2OA"],
                        [NSURL URLWithString:@"https://cdn.vox-cdn.com/thumbor/HuJ4807J3vcVYQAPFBh_nHjIEP4=/0x0:1255x591/1200x800/filters:focal(493x281:693x481)/cdn.vox-cdn.com/uploads/chorus_image/image/62281193/Screen_Shot_2018_11_12_at_12.24.40_PM.0.png"],
                        [NSURL URLWithString:@"https://avatars.yandex.net/get-music-content/34131/3dd7a065.a.36176-1/200x200"],
                        [NSURL URLWithString:@"https://ichef.bbci.co.uk/news/660/cpsprodpb/E5A5/production/_104398785_dddb06af-e91d-443b-b14f-0be2e0cad0be.jpg"],
                        [NSURL URLWithString: @"https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/03/10/11/best-london-travel-guides.jpg?w968h681"],
                        [NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/en/1/15/Dipper_Pines.png"],
                        
                        [NSURL URLWithString:@"https://files.gamebanana.com/img/ico/sprays/pika_copy.png"],
                        [NSURL URLWithString:@"https://a.wattpad.com/useravatar/Surprised_Pikachu.256.647193.jpg"],
                        [NSURL URLWithString:@"https://bratz.mgae.com/images/modules/product-module/pack-addons/pack_img_1/cloe_1.png"],
                        [NSURL URLWithString:@"https://www.catster.com/wp-content/uploads/2017/08/A-fluffy-cat-looking-funny-surprised-or-concerned.jpg"],
                        [NSURL URLWithString: @"https://i.kinja-img.com/gawker-media/image/upload/s--UYWnBrHt--/c_scale,f_auto,fl_progressive,q_80,w_800/wmpvownqus8xwvylswsr.jpg"],
                        [NSURL URLWithString: @"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTopcG9aTZvFE1qaT02DsoYj4Ch2zabw7uAL6hvNG2HA9oDCH7x"],
                        [NSURL URLWithString:@"https://i.ytimg.com/vi/xO8Cz-9qKTI/hqdefault.jpg"],
                        [NSURL URLWithString:@"https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/i/1d6de78a-46e4-4f2c-bcf3-370137fd31e0/dbf1q3v-754ad855-b66f-4734-aff5-b1508322ceb8.png"],
                        [NSURL URLWithString:@"https://o.aolcdn.com/images/dims?quality=85&image_uri=http%3A%2F%2Fo.aolcdn.com%2Fhss%2Fstorage%2Fmidas%2F6623d5a6ae583f81ee3515b6b3615c7f%2F204855766%2Flandscape-1456483171-pokemon2.jpg&client=amp-blogside-v2&signature=a66341cc83efebc3c63cadf0db972d9a16e1b05d"],
                        [NSURL URLWithString:@"https://c-sf.smule.com/sf/s45/arr/8a/a8/aaf6447f-1557-4bd3-9f22-2f828444d8d4.jpg"],
                        [NSURL URLWithString:@"https://media.mnn.com/assets/images/2019/01/grumpy_cat.jpg.653x0_q80_crop-smart.jpg"],
                        [NSURL URLWithString:@"https://www.sciencenews.org/sites/default/files/2019/05/main/articles/052119_lg_dwarfgalaxy_feat.jpg"],
                        [NSURL URLWithString: @"https://cdn.pixabay.com/photo/2014/08/19/19/23/antenna-421843_960_720.jpg"],
                        [NSURL URLWithString: @"https://www.wweek.com/resizer/_DDVSRW-9D8QxpWF7m1epefQi-U=/1200x0/filters:quality(100)/s3.amazonaws.com/arc-wordpress-client-uploads/wweek/wp-content/uploads/2018/02/05191110/cats_web.jpg"],
                        [NSURL URLWithString:@"https://vignette.wikia.nocookie.net/disney/images/e/e3/Profile_-_Dipper_Pines.png/revision/latest?cb=20190318192148"],
                        [NSURL URLWithString:@"https://img-fotki.yandex.ru/get/28072/214291281.d6/0_1f1c56_179bd866_orig.jpg"],
                        [NSURL URLWithString:@"https://cdn21.img.ria.ru/images/93879/37/938793740_0:0:1280:1285_600x600_80_0_1_5a1dfaeec21bc5895c80b18debe2e742.jpg"],
                        [NSURL URLWithString:@"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzcfVWAot5l2cZWQ0kNoJjW55pYwj92EFq3GVDQXddLESN8a79sQ"],
                        [NSURL URLWithString:@"https://mapio.net/images-p/1995333.jpg"],
                        [NSURL URLWithString:@"https://ichef.bbci.co.uk/news/660/cpsprodpb/E5A5/production/_104398785_dddb06af-e91d-443b-b14f-0be2e0cad0be.jpg"],
                        [NSURL URLWithString: @"https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/03/10/11/best-london-travel-guides.jpg?w968h681"],
                        [NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/en/1/15/Dipper_Pines.png"],
                        
                        [NSURL URLWithString:@"https://files.gamebanana.com/img/ico/sprays/pika_copy.png"],
                        [NSURL URLWithString:@"https://a.wattpad.com/useravatar/Surprised_Pikachu.256.647193.jpg"],
                        [NSURL URLWithString:@"https://bratz.mgae.com/images/modules/product-module/pack-addons/pack_img_1/cloe_1.png"],
                        [NSURL URLWithString:@"https://www.catster.com/wp-content/uploads/2017/08/A-fluffy-cat-looking-funny-surprised-or-concerned.jpg"],
                        [NSURL URLWithString: @"https://i.kinja-img.com/gawker-media/image/upload/s--UYWnBrHt--/c_scale,f_auto,fl_progressive,q_80,w_800/wmpvownqus8xwvylswsr.jpg"],
                        [NSURL URLWithString: @"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTopcG9aTZvFE1qaT02DsoYj4Ch2zabw7uAL6hvNG2HA9oDCH7x"],
                        [NSURL URLWithString:@"https://i.ytimg.com/vi/xO8Cz-9qKTI/hqdefault.jpg"],
                        [NSURL URLWithString:@"https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/i/1d6de78a-46e4-4f2c-bcf3-370137fd31e0/dbf1q3v-754ad855-b66f-4734-aff5-b1508322ceb8.png"],
                        [NSURL URLWithString:@"https://o.aolcdn.com/images/dims?quality=85&image_uri=http%3A%2F%2Fo.aolcdn.com%2Fhss%2Fstorage%2Fmidas%2F6623d5a6ae583f81ee3515b6b3615c7f%2F204855766%2Flandscape-1456483171-pokemon2.jpg&client=amp-blogside-v2&signature=a66341cc83efebc3c63cadf0db972d9a16e1b05d"],
                        [NSURL URLWithString:@"https://c-sf.smule.com/sf/s45/arr/8a/a8/aaf6447f-1557-4bd3-9f22-2f828444d8d4.jpg"],
                        [NSURL URLWithString:@"https://cdn.mos.cms.futurecdn.net/rWzAMuCjF3J93nMPaHMH2C-650-80.jpg"],
                        [NSURL URLWithString:@"https://cdn.spacetelescope.org/archives/images/thumb700x/potw1720b.jpg"],
                        [NSURL URLWithString: @"https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Very_large_array_clouds.jpg/800px-Very_large_array_clouds.jpg"],
                        [NSURL URLWithString: @"https://www.wweek.com/resizer/_DDVSRW-9D8QxpWF7m1epefQi-U=/1200x0/filters:quality(100)/s3.amazonaws.com/arc-wordpress-client-uploads/wweek/wp-content/uploads/2018/02/05191110/cats_web.jpg"],
                        [NSURL URLWithString:@"https://images.ua.prom.st/489482909_w128_h128_velikobritaniyatury-v-london.jpg"],
                        [NSURL URLWithString:@"https://www.stylist.co.uk/images/app/uploads/2019/03/01130727/kyms_restaurant_interiors_london1-crop-1554120560-1492x1492.jpg?w=256&h=256&fit=max&auto=format%2Ccompress"],
                        [NSURL URLWithString:@"https://cdn.pixabay.com/photo/2013/04/07/21/29/arc-de-triomphe-101632_960_720.jpg"],
                        [NSURL URLWithString:@"https://i.pinimg.com/originals/6f/aa/e6/6faae69e249239da274b5ccb5cd92f2b.jpg"],
                        [NSURL URLWithString:@"https://cdn.pixabay.com/photo/2016/01/22/16/42/eiffel-tower-1156146_960_720.jpg"],
                        [NSURL URLWithString:@"https://cdn.pixabay.com/photo/2016/11/18/19/01/paris-1836415_960_720.jpg"],
                        [NSURL URLWithString: @"https://cdn.pixabay.com/photo/2013/04/11/19/46/louvre-102840_960_720.jpg"],
                        [NSURL URLWithString:@"https://cdn.pixabay.com/photo/2015/07/15/20/08/paris-846873_960_720.jpg"],
                        
                        [NSURL URLWithString:@"https://cdn.pixabay.com/photo/2013/04/09/08/08/sacre-coeur-102110_960_720.jpg"],
                        [NSURL URLWithString:@"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK4UY9iZM3At3aqWIybfkuNG6l1H1B3EyrBEvfcIdWl2LZ74BkBw"],
                        [NSURL URLWithString:@"https://blog.poferries.com/wp-content/uploads/2016/03/paris-skyline.jpg"],
                        [NSURL URLWithString:@"https://cdn.tourcms.com/a/11676/2019/1/large.jpg"],
                        [NSURL URLWithString: @"https://www.bimago.co.uk/mediacache/catalog/product/cache/5/0/114905/vis_image/274c74608b70eee79c06d11e6fe09132/114905_2.jpg"],
                        [NSURL URLWithString: @"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTopcG9aTZvFE1qaT02DsoYj4Ch2zabw7uAL6hvNG2HA9oDCH7x"],
                        [NSURL URLWithString:@"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkCKkUlWmCZViOP1t_CWC4OPX6c0GrDDVk4siJ_leK7_H9azV14w"],
                        [NSURL URLWithString:@"https://i.pinimg.com/originals/b5/30/fc/b530fc77509e868573e9b1be022ea839.jpg"],
                        [NSURL URLWithString:@"https://www.wherethehelliscarl.com/wp-content/uploads/2019/01/20190104_162939_hdr22705782806324179032..jpg"],
                        [NSURL URLWithString:@"https://www.telegraph.co.uk/content/dam/Travel/Destinations/Europe/United%20Kingdom/London/london-aerial-thames-guide-xlarge.jpg"]
                        ];

    
}

-(void)loadView {
    [super loadView];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:nil
                                                                action:nil];
    
    [self.navigationItem setBackBarButtonItem:backItem];
    self.title = @"Images";
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _imagesURLArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *mainId = @"MainCellid";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:mainId];
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:mainId];
    _url = _imagesURLArray[indexPath.row];
    cell.imageView.tag = indexPath.row;
    if (_url) {
        dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
        dispatch_async(queue, ^(void) {
            NSData *data = [NSData dataWithContentsOfURL: self.url];
            UIImage* image = [[UIImage alloc] initWithData:data];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (cell.imageView.tag == indexPath.row) {
                        cell.imageView.image = [self sizeForImage:image changeToSize:CGSizeMake(100,100)];
                        [cell.imageView setFrame:CGRectMake(0, 0, 150, 150)];
                        cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
                        cell.separatorInset = UIEdgeInsetsZero;
                        cell.layoutMargins = UIEdgeInsetsZero;
                        cell.preservesSuperviewLayoutMargins = NO;
                        [cell setNeedsLayout];
                     }
                });
            }
        });
        [tableView beginUpdates];
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
        [tableView endUpdates];
    }
    
    [cell.imageView setUserInteractionEnabled: YES];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOnImage: withImage:)];
    [tap setDelegate: self];
    [cell.imageView addGestureRecognizer:tap];
 
    
    cell.imageView.image = [self sizeForImage:[UIImage imageNamed:@"placeholder.png"] changeToSize:CGSizeMake(100,100)];
    _imageURL = [_url absoluteString];
    cell.textLabel.text = _imageURL;
    cell.textLabel.numberOfLines = 0;
    
    
    return cell;
    
}

- (UIImage *)sizeForImage:(UIImage *)image changeToSize:(CGSize)newSize {
    
    
    CGRect imageRect = CGRectZero;
    CGFloat imageWidth = newSize.width / image.size.width;
    CGFloat imageHeight = newSize.height / image.size.height;
    CGFloat aspectRatio = MIN ( imageWidth, imageHeight );
    
    imageRect.size.width = image.size.width * aspectRatio;
    imageRect.size.height = image.size.height * aspectRatio;
    imageRect.origin.x = (newSize.width - imageRect.size.width) / 2.0f;
    imageRect.origin.y = (newSize.height - imageRect.size.height) / 2.0f;
    
    UIGraphicsBeginImageContextWithOptions( newSize, NO, 0 );
    [image drawInRect:imageRect];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

#pragma mark - Delegate

- (void)clickOnImage:(UITapGestureRecognizer*)recognizer withImage:(NSInteger*)imageViewTag{
    
    DetailsViewController *detailsVC = [DetailsViewController new];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:recognizer.view.tag inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    detailsVC.detailsImage =  cell.imageView.image;
    NSLog(@"%@ image to sent....", detailsVC.detailsImage);
    [self.navigationController pushViewController:detailsVC animated:NO];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]
                     atScrollPosition:UITableViewScrollPositionMiddle animated:NO];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
