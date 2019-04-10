//
//  Spa.h
//  Spa
//
//  Created by Family Fan on 2018/11/29.
//  Copyright © 2018 Family Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SPA_MODULE "spa"

typedef void (^spa_log_block_t)(NSString *log);

@interface Spa : NSObject

+ (instancetype)sharedInstace;

- (void)usePatch:(NSString *)patch;

- (void)setLogBlock:(spa_log_block_t)block;

@end
