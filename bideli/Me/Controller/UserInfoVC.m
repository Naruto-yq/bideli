//
//  UserInfoVC.m
//  bideli
//
//  Created by 余钦 on 2017/8/31.
//  Copyright © 2017年   reserved.
//
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "UserInfoVC.h"
#import "UserInfoCell.h"

@interface UserInfoVC ()<UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *stringArray;

@property(nonatomic, strong)UIImage *icon;

@property(nonatomic, copy)NSString *nickname;
@property(nonatomic, strong)NSMutableArray *groupArrays;

@end

@implementation UserInfoVC
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人信息";
    [self setupTableView];
    [self SetupLocalData];
    
    self.groupArrays = [NSMutableArray array];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)setupTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT_64) style:UITableViewStyleGrouped];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.scrollEnabled = NO;
    _tableView.sectionHeaderHeight = 9.0f;
    _tableView.sectionFooterHeight = 0.0f;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.contentInset = UIEdgeInsetsMake(-9, 0, 0, 0);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

- (NSArray *)stringArray{
    if (!_stringArray) {
        _stringArray = [[NSArray alloc]init];
    }
    return _stringArray;
}

- (void)SetupLocalData
{
    NSArray *firstString = @[MyLocalizedString(@"UserIcon")];
    NSArray *secondString = @[MyLocalizedString(@"UserNickname"), MyLocalizedString(@"PhoneNumber")];
    NSArray *thirdString = @[MyLocalizedString(@"Logout")];
    NSArray *stringArray = @[firstString, secondString, thirdString];
    self.stringArray = stringArray;
    
    //    NSArray *firstDestVcClass = @[@"NicknameViewController"];
    //    NSArray *secondDestVcClass = @[@"NicknameViewController", @"NicknameViewController", @"NicknameViewController"];
    //    NSArray *thirdDestVcClass = @[@"NicknameViewController"];
    //    NSArray *destVcClassArray = @[firstDestVcClass, secondDestVcClass, thirdDestVcClass];
    //    self.destVcClassArray = destVcClassArray;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.stringArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sectionStringArr = self.stringArray[section];
    return sectionStringArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserInfoCell *cell = [UserInfoCell cellWithTableView:tableView];
    
    NSArray *sectionStringArr = self.stringArray[indexPath.section];
    cell.title = sectionStringArr[indexPath.row];
    if (self.icon) {
        cell.icon = self.icon;
    }
    cell.indexPath = indexPath;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        [self Logout];
        
    }else if(indexPath.section == 1){
        if (indexPath.row == 0) {

        }else if(indexPath.row == 1){

        }
    }else if(indexPath.section == 0){
        [self ShowActionSheetForIcon];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 72;
    }else{
        return 55;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return 25.0f;
    }else {
        return 9.0f;
    }
}

- (void)Logout{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *logoutAction = [UIAlertAction actionWithTitle:@"退出登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [GLobalLocalData setLoginState:@"0"];

    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:logoutAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark ---- 选取本地照片，拍照
- (void)ShowActionSheetForIcon
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"拍照",@"从手机相册选取",nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self cameraBtnPressed];
            break;
            
        case 1:
            [self albumBtnPressed];
            break;
            
        default:
            break;
    }
}

- (void)albumBtnPressed
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"提示" message:@"该设备不支持从相册选取文件" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:NULL];
        [alert show];
    }
    else {
        UIImagePickerController *filePicker = [[UIImagePickerController alloc] init];
        filePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        filePicker.delegate = self;
        filePicker.mediaTypes = [NSArray arrayWithObject:@"public.image"];
        filePicker.allowsEditing = YES;
        filePicker.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController presentViewController:filePicker animated:YES completion:^{
            
            
        }];
    }
}

- (void)cameraBtnPressed
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"提示" message:@"该设备不支持拍照" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:NULL];
        [alert show];
    }
    else {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.sourceType =  UIImagePickerControllerSourceTypeCamera;
        imagePickerController.delegate = self;
        imagePickerController.mediaTypes = [NSArray arrayWithObject:@"public.image"];
        imagePickerController.allowsEditing = YES;
        [self.navigationController presentViewController:imagePickerController animated:YES completion:nil];
    }
}

// 检测是否打开相机权限
- (BOOL)isCameraPermissions
{
    BOOL ret = YES;
    if([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
    {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (authStatus != AVAuthorizationStatusAuthorized && authStatus != AVAuthorizationStatusNotDetermined)
        {
            ret = NO;
        }
    }
    return ret;
}

#pragma mark ---  imagePicker delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *originImage = [info valueForKey:UIImagePickerControllerEditedImage];
    
    CGSize cropSize;
    cropSize.width = 180;
    cropSize.height = cropSize.width * originImage.size.height / originImage.size.width;
//    originImage = [originImage imageByScalingToSize:cropSize];
    
    [picker dismissViewControllerAnimated:YES completion:^{
        //网络请求，上传图片，设置头像。
    }];
}

- (NSString *)getUniqueStrByUUID
{
    CFUUIDRef    uuidObj = CFUUIDCreate(nil);//create a new UUID
    
    //get the string representation of the UUID
    
    NSString    *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(nil, uuidObj);
    
    CFRelease(uuidObj);
    
    return uuidString;
    
}

@end
