//
//  ViewController.m
//  SpaDemo
//
//  Created by Family Fan on 2018/11/29.
//  Copyright © 2018 Family Fan. All rights reserved.
//

#import "ViewController.h"
#import "Spa.h"

typedef struct SPA_POINT {
    char *s;
}SPA_POINT;

@interface OCPoint : NSObject

@property (nonatomic) char *s;

@end

@implementation OCPoint


@end

@interface Persion1 : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) int age;

@end

@implementation Persion1

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[Spa sharedInstace] setLogBlock:^(NSString *log) {
        printf("%s", log.UTF8String);
    }];
    NSString* script = @"spa.log('trace script'); spa.trace.start('www.baidu.com') \n";
    [[Spa sharedInstace] usePatch:script];
}

- (IBAction)usePatch:(id)sender {
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://127.0.0.1:8088"]];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    if (error == nil) {
        NSString* patchString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        [[Spa sharedInstace] usePatch:patchString];
        
        [self doSomeThing];
    }
}

- (void)doSomeThing
{
    
}

@end
